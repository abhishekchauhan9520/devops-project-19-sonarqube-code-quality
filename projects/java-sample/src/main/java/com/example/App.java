package com.example;

public final class App {
    private App() {
    }

    public static String greeting(String name) {
        if (name == null || name.isBlank()) {
            return "Hello, SonarQube";
        }
        return "Hello, " + name.trim() + "!";
    }

    public static void main(String[] args) {
        System.out.println(greeting(args.length > 0 ? args[0] : null));
    }
}
