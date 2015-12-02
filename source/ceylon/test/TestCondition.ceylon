"Represents a condition which has to be fullfiled to execute test, 
 in other case the test execution is [[skipped|TestState.skipped]].
 The [[ignore]] annotation is one simple implementation of this mechanism.
 
 The example below shows `bug` annotation, which allow to skip test, 
 until the reported issue is resolved. 
 
     shared annotation bug(String id) => BugAnnotation(id);
     
     shared final annotation class BugAnnotation(String id)
              satisfies OptionalAnnotation<BugAnnotation,FunctionDeclaration> & TestCondition {
         
         shared actual Result evaluate(TestDescription description) {
             // check if the issue is already resolved
         }
         
     } 
 
     test
     bug(\"1205\")
     shared void shouldTestSomethingButThereIsBug() {
     }
 
"
shared interface TestCondition {
    
    "Evaluate the condition for the given test."
    shared formal Result evaluate(TestDescription description);
    
    "The result of evaluating."
    shared class Result(successful, reason = null) {
        
        "The flag if the condition was fulfilled or not."
        shared Boolean successful;
        
        "The reason why the test is skipped."
        shared String? reason;
        
        /*
        new init(Boolean successful, String? reason) {
            successful = successful; 
            reason = reason2;
        }
        
        shared new success(String reason) extends init(true, reason) {}
        
        shared new failed(String reason) extends init(false, reason) {}
         */
        
    }
    
}