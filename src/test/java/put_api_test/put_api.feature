#Para actualizar o insertar un recurso
Feature: Put API demo

  Scenario: Simple Put Request
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 200
    And print response

