Feature: Post API demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    #Variable que lee el archivo json de respuesta
    * def expectedOutput = read("response.json")

  Scenario: Simple POST Request
    Given url 'https://reqres.in/api/users'
    #Request para enviar
    And request {"name": "Camilo","job": "teacher"}
    When method POST
    Then status 201
    And print response

  Scenario: Post request with background
    Given path '/users'
    And request {"name": "Camilo","job": "teacher"}
    When method POST
    Then status 201
    And print response

  Scenario: Post request with Assertions
    Given path '/users'
    And request {"name": "Camilo","job": "teacher"}
    When method POST
    Then status 201
    #Usamos '#tipo_dato' para un tipo de dato esperado
    #Usamos '#ignore' para ignorar una clave
    And match response == {"name": "Camilo","job": "teacher","id": "#string","createdAt": "#ignore"}
    And print response

  Scenario: Post request read response from file
    Given path '/users'
    And request {"name": "Laura","job": "Assistant"}
    When method POST
    Then status 201
    #Verificamos que la respuesta sea igual a la esperada del json
    And match response == expectedOutput
    And print response

  Scenario: Post request read request from file
    Given path '/users'
    #Variable que lee el archivo json de request
    And def requestBody = read("request.json")
    #Enviamos la request con la variable anterior
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

    Scenario: Post request read request from file and change values
      Given path '/users'
      #Leemos el archivo json de la request
      And def reqBody = read("request.json")
      #Buscamos y modificamos la variable deseada
      And set reqBody.job = 'Engineer'
      And request reqBody
      When method POST
      Then status 201
      And match response == expectedOutput
      And print response


