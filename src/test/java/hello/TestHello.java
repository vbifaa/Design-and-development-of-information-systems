package hello;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;


public class TestHello {
    @Test
    void test_sum() {
        Assertions.assertEquals(Hello.sum(1,3), 4);
        Assertions.assertEquals(Hello.sum(5,10), 15);
        Assertions.assertEquals(Hello.sum(0,3), 3);
        Assertions.assertEquals(Hello.sum(3,0), 3);
        Assertions.assertEquals(Hello.sum(-10,10), 0);
    }
}
