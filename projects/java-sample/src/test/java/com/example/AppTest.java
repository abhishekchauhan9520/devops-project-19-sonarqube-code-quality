package com.example;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class AppTest {
    @Test
    public void defaultsWhenNameMissing() {
        assertEquals("Hello, SonarQube", App.greeting(null));
        assertEquals("Hello, SonarQube", App.greeting("   "));
    }

    @Test
    public void formatsName() {
        assertEquals("Hello, Abhishek!", App.greeting("  Abhishek  "));
    }
}
