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
    : Variable Index '=' arrayValue
    | Variable '=' varValue
    ;

functionCall
    : 'touch' value
    | 'mkdir' value
    | 'rm' value
    | 'cp' value value
    ;

arrayValue
	: varValue
	| EmptyValue
	;
	 
varValue
	: expression
	| Input
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
    : ["] (~["\r\n] | '\\\\' | '\\"')* ["] {setText(getText().substring(1, getText().length()-1));}
    | ['] (~['\r\n] | '\\\\' | '\\\'')* ['] {setText(getText().substring(1, getText().length()-1));}
    ;
    
Input
	: 'INPUT'
	;
	
EmptyValue
	: '[' ']'
	;

Comment
    : ('//' ~[\r\n]* | '/*' .*? '*/') -> skip
    ;

Space
    : [ \t\r\n\u000C] -> skip
    ;
