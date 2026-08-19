#!/bin/bash

# Script para ejecutar todos los tests localmente

echo "=== QA Test Runner ==="
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Run Karate API Tests
echo "Running Karate API Tests..."
cd ../karate-api-testing
./gradlew test
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Karate tests passed${NC}"
else
    echo -e "${RED}✗ Karate tests failed${NC}"
fi

# Run Rest Assured Tests
echo ""
echo "Running Rest Assured Tests..."
cd ../api-testing-rest-assured
mvn clean test
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Rest Assured tests passed${NC}"
else
    echo -e "${RED}✗ Rest Assured tests failed${NC}"
fi

# Run Playwright Tests
echo ""
echo "Running Playwright Tests..."
cd ../playwright-ecommerce
npm test
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Playwright tests passed${NC}"
else
    echo -e "${RED}✗ Playwright tests failed${NC}"
fi

# Run Cypress Tests
echo ""
echo "Running Cypress Tests..."
cd ../cypress-ecommerce
npm run cy:run:headless
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Cypress tests passed${NC}"
else
    echo -e "${RED}✗ Cypress tests failed${NC}"
fi

# Run k6 Load Test
echo ""
echo "Running k6 Load Test..."
cd ../performance-testing-k6
k6 run scripts/load-test.js
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ k6 tests passed${NC}"
else
    echo -e "${RED}✗ k6 tests failed${NC}"
fi

echo ""
echo "=== All tests completed ==="
