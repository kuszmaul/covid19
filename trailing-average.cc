#include <cassert>
#include <cctype>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <vector>

static void skipspaces(char *line, size_t len, size_t *ii) {
  if (*ii >= len) return;
  while (isspace(line[*ii])) {
    (*ii)++;
    if (*ii >= len) break;
  }
}
static void skip_to_space(char *line, size_t len, size_t *ii) {
  if (*ii >= len) return;
  while (!isspace(line[*ii])) {
    (*ii)++;
    if (*ii >= len) break;
  }
}
static int gather_number(char *line, size_t len, size_t *ii) {
  // Return 0 if we got a number, 1 if we ran out.  For NaN or anything else store SIZE_MAX in *num.
  skipspaces(line, len, ii);
  if (*ii >= len) return -1;
  if (!isdigit(line[*ii])) {
    skip_to_space(line, len, ii);
    return -1;
  }
  if (*ii >= len) return -1;
  int r = 0;
  while (isdigit(line[*ii]))  {
    r = 10 * r + line[*ii] - '0';
    (*ii)++;
    if (*ii >= len) break;
  }
  return r;
}

const size_t A = 7;

static void emit3 (const std::vector<int> &v) {
  // Print the number
  if (v.back() == -1) printf("    NaN ");
  else printf("%7d ", v.back());

  // Print the diff of the last two numbers
  if (v.size() < 2
      || v[v.size()-1] == -1
      || v[v.size()-2] == -1)
    printf("    NaN ");
  else {
    printf("%7d ", v[v.size()-1]-v[v.size()-2]);
  }

  // Print the 7 day running average
  if (v.size() < A+1
      || v[v.size()-1] == -1
      || v[v.size()-A-1] == -1)
    printf("    NaN ");
  else
    printf("%7.1f ", (v[v.size()-1] - v[v.size()-A-1])/(double)A);
}

static void emit2 (const std::vector<int> &v) {
  // Print the number
  if (v.back() == -1) printf("    NaN ");
  else printf("%7d ", v.back());

  // Print the 7 day running average
  if (v.size() < A) goto nan;
  {
    int sum = 0;
    for (size_t i = 0; i < A; i++) {
      int thisv = v[v.size()-A+i];
      if (thisv == -1) goto nan;
      sum += thisv;
    }
    printf("%7.1f ", sum/(double)A);
    return;
  }
 nan:
  printf("    NaN ");
}

static void emit7log(const std::vector<int> &v) {
  if (v.size() < A+1) {
 nan:
    printf("    NaN ");
  } else {
    double sumlog = 0;
    for (size_t i = 0 ; i < A; i++) {
      int thisv = v[v.size()-A+i];
      if (thisv == -1) goto nan;
      int prevv = v[v.size()-A+i-1];
      if (prevv == -1) goto nan;
      if (thisv == prevv) goto nan;
      assert(thisv > prevv);
      int diff = thisv-prevv;
      sumlog += log(diff);
    }
    printf("%7.1f ", exp(sumlog/A));
  }
}

int main(int argc __attribute__((unused)), char **argv __attribute__((unused))) {
  ssize_t nread;
  char *line = NULL;
  size_t len = 0;
  std::vector<int> cases;
  std::vector<int> tests;
  std::vector<int> deaths;
  std::vector<int> hosps;
  std::vector<int> ltcf;
  std::vector<int> icu;
  std::vector<int> ltcf_deaths;
  size_t linenum = 0;
  // 7Geo is the 7-day trailing geometric average
  printf("#date    day"
         "   cases newcase  7cases   tests newtest  7tests"
         "   death newdeat  7death   hosps  7hosps"
         "   ltcf  newltcf   7ltcf    icus   7icus"
         "  ldeath newldea 7ldeath 7casGeo 7DeaGeo"
         "\n");
  while ((nread = getline(&line, &len, stdin)) != -1) {
    if (len == 0) continue;
    if (line[0] == '#') continue;
    size_t i = 0;
    while (!isspace(line[i])) {
      putchar(line[i]);
      i++;
      if (i >= len) break;
    } // date printed
    putchar(' ');
    {
      int daynum = gather_number(line, len, &i);
      assert(daynum >= 0);
      printf("%3d ", daynum);
    }
    cases.push_back(gather_number(line, len, &i));
    emit3(cases);
    tests.push_back(gather_number(line, len, &i));
    emit3(tests);
    deaths.push_back(gather_number(line, len, &i));
    emit3(deaths);
    gather_number(line, len, &i); // ignore hosps
    hosps.push_back(gather_number(line, len, &i));
    emit2(hosps);
    ltcf.push_back(gather_number(line, len, &i));
    emit3(ltcf);
    icu.push_back(gather_number(line, len, &i));
    emit2(icu);
    ltcf_deaths.push_back(gather_number(line, len, &i));
    emit3(ltcf_deaths);
    emit7log(cases);
    emit7log(deaths);
    printf("\n");
    linenum++;
  }
  free(line);
  return 0;
}
