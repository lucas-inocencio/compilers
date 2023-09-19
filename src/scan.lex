%{
#include <iostream>
std::string lexema;
%}

/* Definitions for regular expressions */
WS          [ \t\n]
COMENTARIO  "/*"([^*]|("*"+[^*/]))*"*"+"/"
FOR         [Ff][Oo][Rr]
IF          [Ii][Ff]
STRING      \"([^\\\"]|\\.)*\"|\'([^\\\']|\\.)*\'
MAIG        ">="
MEIG        "<="
IG          "=="
DIF         "!="
DIGIT       [0-9]
LETTER      [A-Za-z]
NUM         {DIGIT}+
UNDERLINE   "_"
DOLLARSIGN  "$"
ID          ({LETTER}|{UNDERLINE}|{DOLLARSIGN})({LETTER}|{DIGIT}|{UNDERLINE})*
INT         {NUM}
FLOAT       ({NUM}"."{NUM}([eE][-+]?{NUM})?|{NUM}[Ee][-+]?{NUM})
INVALID_ID  ({LETTER}|{UNDERLINE}|{DOLLARSIGN})({LETTER}|{DIGIT}|{UNDERLINE})*{DOLLARSIGN}({LETTER}|{DIGIT}|{UNDERLINE})*

%%

    /* Patterns and actions */
{WS}         { /* Ignore spaces, tabs, and '\n' */ }
{COMENTARIO} { lexema = yytext; return _COMENTARIO; }
{FOR}        { lexema = yytext; return _FOR; }
{IF}         { lexema = yytext; return _IF; }
{STRING}     { 
    lexema = yytext;
    lexema.erase(0, 1);             // Remove the leading quote (")
    lexema.erase(lexema.length() - 1); // Remove the trailing quote (")
    return _STRING;
}
{MAIG}       { lexema = yytext; return _MAIG; }
{MEIG}       { lexema = yytext; return _MEIG; }
{IG}         { lexema = yytext; return _IG; }
{DIF}        { lexema = yytext; return _DIF; }
{ID}         { lexema = yytext; return _ID; }
{INT}        { lexema = yytext; return _INT; }
{FLOAT}      { lexema = yytext; return _FLOAT; }
{INVALID_ID} {
    std::cout << "Erro: Identificador invalido: " << yytext << std::endl;
}

.           {
    lexema = yytext;
    return *yytext;
}
%%

/* The main function is automatically included during evaluation. */