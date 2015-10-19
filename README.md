# file-flow-grammar
ANTLR grammar for the file flow language to be used in the File Flow Analysis project.

I used Apache Ant to build and test the grammar.

You should be able to execute the following commands in this order to view the parse tree of the test program:
    1. 'ant generate'
    2. 'ant compile'
    3. 'ant grun' or 'ant grun -Dtestfile="test/scriptname.ffa"

The grammar is 'src/FileFlow.g4' and the test script is 'test/test.ffa'

You may edit the test script if you wish to play around and see how the parse tree changes.
