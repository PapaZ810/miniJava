grammar MiniJava;

goal
    : methodBody EOF
    ;

methodBody
    : statement*
    ;

statement
    : '{' statement* '}'
    | variableDeclaration
    | expr ';'
    | ';'
    ;

variableDeclaration
    : (NAME | TYPE) variableDeclarationItem (',' variableDeclarationItem)* ';'
    ;

variableDeclarationItem
    : NAME
    | NAME '=' expr
    ;

expr
    : NAME ('++' | '--')
    | ('++' | '--' | '+' | '-') NAME
    | '(' (NAME | TYPE) ')' expr
    | expr ('*' | '/') expr
    | expr ('+' |'-' ) expr
    |<assoc=right>expr '=' expr ';'
    | '(' expr (',' expr )* ')'
    | 'print' '(' (expr (',' expr )*)? ')'
    | INT
    | DOUBLE
    | STRING
    | 'true'
    | 'false'
    | NAME
    ;

LINE_COMMENT
    : '//' .*? ('\n' | EOF) -> skip
    ;


MULTI_COMMENT
    : '/*' .*? '*/' -> skip
    ;

STRING
    : '"' .*? '"'
    ;

TYPE
    : 'double'
    | 'byte'
    | 'char'
    | 'final'
    | 'boolean'
    | 'int'
    | 'short'
    | 'float'
    | 'String'
    ;

BLOCKS
    : 'for'
    | 'if'
    | 'while'
    ;

KEYWORDS
    : 'abstract'
    | 'continue'
    | 'new'
    | 'switch'
    | 'assert'
    | 'default'
    | 'package'
    | 'synchronized'
    | 'do'
    | 'goto'
    | 'private'
    | 'this'
    | 'break'
    | 'implements'
    | 'protected'
    | 'throw'
    | 'else'
    | 'import'
    | 'public'
    | 'throws'
    | 'case'
    | 'enum'
    | 'instanceof'
    | 'return'
    | 'transient'
    | 'catch'
    | 'extends'
    | 'try'
    | 'interface'
    | 'static'
    | 'void'
    | 'class'
    | 'finally'
    | 'long'
    | 'strictfp'
    | 'volatile'
    | 'const'
    | 'native'
    | 'super'
    | '_'
    | 'true'
    | 'false'
    ;

INT
    : [0-9]+
    ;

fragment FIXED_POINT
    : [0-9]+ '.' [0-9]*
    | [0-9]* '.' [0-9]+
    ;

DOUBLE
    : FIXED_POINT
    | (FIXED_POINT | INT) [eE] [+-]? INT
    ;

NAME
    : [a-zA-Z_$][a-zA-Z_$0-9]*
    ;

WS
    : [ \n\r\t]+ -> skip
    ;