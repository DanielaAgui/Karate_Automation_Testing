Feature: Sample API tests

  Scenario: Test a sample GET API

    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200