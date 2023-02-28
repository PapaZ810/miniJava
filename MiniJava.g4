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
    : type variableDeclarationItem (',' variableDeclarationItem)* ';'
    ;

variableDeclarationItem
    : NAME
    | NAME '=' expr
    ;

expr
    : NAME ('++' | '--')
    | ('++' | '--' | '+' | '-') NAME
    | '(' type ')' expr
    | expr ('*' | '/' | '%') expr
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

type
    : 'double'
    | 'boolean'
    | 'int'
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

KEYWORD
    : 'abstract'   | 'continue'   | 'for'          | 'new'         | 'switch'
    | 'assert'     | 'default'    | 'if'           | 'package'     | 'synchronized'
    | 'boolean'    | 'do'         | 'goto'         | 'private'     | 'this'
    | 'break'      | 'double'     | 'implements'   | 'protected'   | 'throw'
    | 'byte'       | 'else'       | 'import'       | 'public'      | 'throws'
    | 'case'       | 'enum'       | 'instanceof'   | 'return'      | 'transient'
    | 'catch'      | 'extends'    | 'int'          | 'short'       | 'try'
    | 'char'       | 'final'      | 'interface'    | 'static'      | 'void'
    | 'class'      | 'finally'    | 'long'         | 'strictfp'    | 'volatile'
    | 'const'      | 'float'      | 'native'       | 'super'       | 'while'
    | '_'
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