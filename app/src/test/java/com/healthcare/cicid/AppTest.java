package com.healthcare.cicd;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AppTest {

    @Test
    void pipelineStatusShouldBeReady() {
        assertEquals(
            "CI/CD validation target is ready",
            App.getPipelineStatus()
        );
    }
}