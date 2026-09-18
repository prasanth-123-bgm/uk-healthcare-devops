# UK Healthcare Patient Management Platform

## T-001 - CI/CD Pipeline Setup

### Objective

Set up and validate a CI/CD pipeline using GitHub Actions
for automated build, testing, packaging, deployment, and
deployment verification.

## Technology

- GitHub Actions
- Git
- Java 17
- Maven
- JUnit
- Bash

## Pipeline

```text
Git Push
    ↓
GitHub Actions
    ↓
Checkout
    ↓
Java Setup
    ↓
Build & Test
    ↓
Package
    ↓
Upload Artifact
    ↓
Download Artifact
    ↓
Deploy
    ↓
Verify Deployment
