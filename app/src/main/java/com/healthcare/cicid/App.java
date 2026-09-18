package com.healthcare.cicd;

public class App {

    public static String getPipelineStatus() {
        return "CI/CD validation target is ready";
    }

    public static void main(String[] args) {
        System.out.println(getPipelineStatus());
    }
}