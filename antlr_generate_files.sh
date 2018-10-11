mkdir generated_antlr_files
java -classpath ./antlrworks-1.4.3.jar:. org.antlr.Tool PDDL.g -o generated_antlr_files/
