Feature: Get API demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

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
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match response.data[3].id == 10
    