#Para consultar información
Feature: Get API demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response.json")

  Scenario: Simple Get Request
    #Url completa de la api
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    #Imprimimos los datos de respuesta de la api
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario: Get Request with background
    #Endpoint de la api
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  Scenario: Get Request with path and params
    Given path '/users'
    #Parámetros a usar
    And param page = 2
    When method GET
    Then status 200
    And print response

  Scenario: Get Request with Assertions

    Given path '/users'
    #Parámetros a usar
    And param page = 2
    When method GET
    Then status 200
    And print response
    #Verificamos 'first_name' diferente a null en el objeto cero de data de la respuesta
    And match response.data[0].first_name != null
    #Verificamos la longitud del objeto data
    And assert response.data.length == 6
    #Verificamos el 'id' del objeto tres de data de la respuesta
    #El signo $ significa la respuesta de la api
    And match $.data[3].id == 10
    #Verificamos 'last_name' del objeto cuatro de la data de la respuesta
    And match $.data[4].last_name == 'Edwards'

  Scenario: Practica single user Get Request
    Given path '/users/2'
    When method GET
    Then status 200
    And print response
    And match $.data.first_name == 'Janet'

  Scenario: Practica list resource Get Request
    Given path '/unknown'
    When method GET
    Then status 200
    And print response
    And match $.data[2].name == 'true red'
    And match $.data[2].color == '#BF1932'

  Scenario: Practica single resource Get Request
    Given path '/unknown/2'
    When method GET
    Then status 200
    And print response
    And match response == expectedOutput

    Scenario: Practica single user not found Get Request
      Given path '/users/23'
      When method GET
      Then status 404
      And print response



