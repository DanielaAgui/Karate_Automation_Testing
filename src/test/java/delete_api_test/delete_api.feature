#Para eliminar un recurso
Feature: DELETE API demo

  Scenario: Simple Delete Request
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204