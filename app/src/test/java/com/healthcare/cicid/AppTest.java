package com.healthcare.cicd;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AppTest {

    @Test
    void pipelineStatusShouldBeReady() {
        assertEquals(
            "THIS TEST SHOULD FAIL",
            App.getPipelineStatus()
        );
    }
}