-- Create database:
.read ./create_fixture.sql

-- Read user student solution and save any output as markdown in user_output.md:
.mode markdown
.output user_output.md
.read ./resistor-color-duo.sql
.output

-- Create a clean testing environment:
.read ./create_test_table.sql

-- Comparison of user input and the tests updates the status for each test:
UPDATE tests
SET status = 'pass'
FROM (SELECT color1, color2, result FROM "color_code") AS actual
WHERE (actual.color1, actual.color2, actual.result) = (tests.color1, tests.color2, tests.expected);

-- Update message for failed tests to give helpful information:
UPDATE tests
SET message = 'Result for ' || tests.color1 || ' and ' || tests.color2 || ' is "' || actual.result || '", but should be: "' || tests.expected || '"'
FROM (SELECT color1, color2, result FROM "color_code") AS actual
WHERE (actual.color1, actual.color2) = (tests.color1, tests.color2) AND tests.status = 'fail';

-- Save results to ./output.json (needed by the online test-runner)
.mode json
.once './output.json'
SELECT description, status, message, output, test_code, task_id
FROM tests;

-- Display test results in readable form for the student:
.mode table
SELECT description, status, message
FROM tests;