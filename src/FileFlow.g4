grammar FileFlow;

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
    : Identifier '=' expression
    ;

functionCall
    : 'touch' Identifier
    | 'mkdir' Identifier
    | 'rm' Identifier
    | 'cp' Identifier Identifier
    ; 

expression
    : Identifier'.'Identifier
    | Identifier
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
    | 'exists' Identifier
    | 'other'
    ;

Identifier
    : '$x'[0-9]+ 
    | String
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
