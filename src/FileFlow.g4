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
    : Variable Index? '=' expression
    | Variable Index? '=' Input
    ;

functionCall
    : 'touch' expression
    | 'mkdir' expression
    | 'rm' expression
    | 'cp' expression expression
    ;

expression
    : value'.'value
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
    : Variable Index?
    | String
    ;

Variable
    : '$x'[0-9]+
    ;

Index
    : '[' '?' ']'
    ;

String
    : ["] (~["\r\n] | '\\\\' | '\\"')* ["]
    | ['] (~['\r\n] | '\\\\' | '\\\'')* [']
    ;
    
Input
	: 'INPUT'
	;

Comment
    : ('//' ~[\r\n]* | '/*' .*? '*/') -> skip
    ;

Space
    : [ \t\r\n\u000C] -> skip
    ;
