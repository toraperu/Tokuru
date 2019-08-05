#include "ruby.h"

#include <libexslt/exslt.h>

/*top*/
extern int t(void);
int main(int argc, char **argv)
{
  if (argc > 1000000) {
    printf("%p", &t);
  }

  return 0;
}
int t(void) { void ((*volatile p)()); p = (void ((*)()))exsltFuncRegister; return !p; }
