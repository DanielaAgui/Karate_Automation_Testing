Feature: Patch API demo

  Scenario: Simple PATCH Request
    Given url 'https://reqres.in/api/users/2'
    And request {"name": "morpheus","job": "zion resident"}
    When method PATCH
    Then status 200
    And print response
