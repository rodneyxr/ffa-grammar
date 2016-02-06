grammar FileFlow;

@header {
package edu.utsa.fileflow.antlr;
}

prog
    : block EOF
    ;

block
    : statement*
    ;

statement
    : assignment ';'
    | functionCall ';'
    | ifStatement
    | whileStatement
    ;

assignment
    : Variable Indices? '=' expression
    ;

functionCall
    : 'touch' expression
    | 'mkdir' expression
    | 'rm' expression
    | 'cp' expression expression
    ; 

expression
    : expression'.'expression
    | value
    ;

ifStatement
    : ifStat elseIfStat* elseStat? '}'
    ;

ifStat
    : 'if' '(' condition ')' '{' block
    ;

elseIfStat
    : '}' 'else' 'if' '(' condition ')' '{' block
    ;

elseStat
    : '}' 'else' '{' block
    ;

whileStatement
    : 'while' '(' condition ')' '{' block '}'
    ;

condition
    : '(' condition ')'
    | '!' condition
    | condition '&&' condition
    | condition '||' condition
    | 'exists' expression
    | 'other'
    ;

value
    : Variable Indices?
    | String
    ;

Variable
    : '$x'[0-9]+
    ;

Indices
    : ('['[0-9]+']')+
    ;

String
    : ["] (~["\r\n] | '\\\\' | '\\"')* ["]
    | ['] (~['\r\n] | '\\\\' | '\\\'')* [']
    ;

Comment
    : ('//' ~[\r\n]* | '/*' .*? '*/') -> skip
    ;

Space
    : [ \t\r\n\u000C] -> skip
    ;
