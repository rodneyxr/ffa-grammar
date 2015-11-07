# file-flow-grammar
ANTLR grammar for the file flow language to be used in the File Flow Analysis project.

I used Apache Ant to build and test the grammar.

You should be able to execute the following commands in this order to view the parse tree of the test program:  
  1. `ant generate`  
  2. `ant compile`  
  3. `ant grun` or `ant grun -Dtestfile="test/scriptname.ffa"`  

or if using eclipse:  
  1. Import the project using egit in eclipse  
  2. Right click on build.xml > Run As > Ant Build  
  3. Source files will be generated in src under `edu.utsa.fileflow.antlr`  

The grammar file is 'src/FileFlow.g4' and the test script is 'test/test.ffa'

You may edit the test script if you wish to play around and see how the parse tree changes.

If you wish to generate the source files and wish to use it in another eclipse project:  
  1. Right click on the project that will be using File Flow Grammar  
  2. Select Build Path > Configure Build Path...  
  3. Click the Projects tab  
  4. Click Add... and select FileFlowGrammar  
  5. Select Okay then Apply  