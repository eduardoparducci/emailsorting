%{

#include <stdio.h>
#include <string.h>

unsigned email = 0;
unsigned unicamp = 0;
unsigned feec = 0;

%}

LETRA [a-zA-Z]
DIGITO [0-9]
ALFANUM[A-Za-z0-9]
PALAVRA {LETRA}+
INTEIRO {LETRA}+
ALFANUMERICO{ALFANUM}+

%%
{ALFANUMERICO}\@({PALAVRA}\.)*fee\.unicamp\.br(\ |\n) {
  email++;
  unicamp++;
  feec++;
}
{ALFANUMERICO}\@({PALAVRA}\.)*unicamp\.br(\ |\n) {
  email++;
  unicamp++;
}
{ALFANUMERICO}\@{PALAVRA}(\.{PALAVRA})*(\ |\n) {
  email++;
}
[[:space:]]+ ;
[[:^space:]]+ ;
%%

int main() {
  yylex();
  printf("%d %d %d\n", email, unicamp, feec);
  return 0;
}
