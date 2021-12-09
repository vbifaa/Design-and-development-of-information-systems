package hello;

import static org.junit.Assert.*;
import org.junit.Test;


public class TestHello {
    @Test
    public void test_sum() {
        assertEquals(Hello.sum(1,3), 4);
        assertEquals(Hello.sum(5,10), 15);
        assertEquals(Hello.sum(0,3), 3);
        assertEquals(Hello.sum(3,0), 3);
        assertEquals(Hello.sum(-10,10), 0);
    }
}
