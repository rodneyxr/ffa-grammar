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
    : Variable Indecies? '=' expression
    ;

functionCall
    : 'touch' value
    | 'mkdir' value
    | 'rm' value
    | 'cp' value value
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
    | 'exists' value
    | 'other'
    ;

value
    : Variable Indecies?
    | String
    ;

Variable
    : '$x'[0-9]+
    ;

Indecies
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
