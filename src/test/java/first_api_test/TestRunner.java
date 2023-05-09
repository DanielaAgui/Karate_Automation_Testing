package first_api_test;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test

    public Karate curso() {
        //Ruta del archivo feature
        return Karate.run("classpath:first_api_test/first_api_test.feature");
    }
}