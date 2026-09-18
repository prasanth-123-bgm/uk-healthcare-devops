# T-001 – CI/CD Pipeline Setup

## 1. Objective

Set up and validate a CI/CD pipeline using GitHub Actions
for automated build, testing, packaging, deployment, and
deployment verification.

## 2. CI/CD Tool

GitHub Actions

## 3. Validation Technology

Java 17  
Maven  
JUnit

A lightweight Java/Maven validation target was used to
demonstrate the CI/CD workflow independently of the
application frontend and backend workstreams.

## 4. Pipeline Flow

Git Push
   ↓
GitHub Actions
   ↓
Checkout Source Code
   ↓
Set up Java
   ↓
Build and Test
   ↓
Package JAR
   ↓
Upload Artifact
   ↓
Download Artifact
   ↓
Deploy
   ↓
Deployment Verification

## 5. Pipeline Stages

### 5.1 Source Checkout

The workflow checks out the repository source code
using GitHub Actions checkout.

### 5.2 Java Environment Setup

The workflow configures Java 17 using the GitHub Actions
Java setup action.

### 5.3 Build and Test

Maven is used to compile the Java project and execute
the JUnit automated test.

Command:

    mvn clean test

### 5.4 Package

After successful testing, Maven packages the application
as a JAR artifact.

Command:

    mvn package

### 5.5 Artifact Handling

The generated JAR is uploaded as a GitHub Actions artifact.

The deployment job downloads this artifact for deployment.

### 5.6 Deployment

The deployment script creates a deployment directory and
copies the generated JAR into it.

Script:

    scripts/deploy.sh

### 5.7 Deployment Verification

The deployment script verifies that the JAR exists in the
deployment directory.

If the artifact is present, deployment verification succeeds.
If the artifact is missing, the deployment step exits with
a failure.

## 6. Job Dependency

The deployment job depends on successful completion of the
build-and-test job.

This is configured using:

    needs: build-and-test

Therefore, deployment does not proceed when the CI validation
fails.

## 7. Failure Handling Validation

An intentional test failure was introduced to validate the
pipeline dependency.

Observed behavior:

    Build/Test → Failed
    Deployment → Skipped

After restoring the correct test condition, the pipeline
successfully completed the build, test, package, deployment,
and verification stages.

## 8. Validation Result

The CI/CD pipeline was successfully executed through GitHub
Actions.

Validated stages:

- Source checkout
- Java setup
- Maven build
- Automated testing
- JAR packaging
- Artifact upload
- Artifact download
- Deployment
- Deployment verification
- Failure handling

## 9. Deployment Scope

The deployment demonstrated in this task is a controlled
CI/CD validation deployment using the lightweight validation
target.

It is not represented as deployment of the complete
UK Healthcare Patient Management Platform to a production
cloud environment.

The pipeline can subsequently be integrated with the actual
application repository and approved deployment environment
when those are provided by the relevant project workstreams.