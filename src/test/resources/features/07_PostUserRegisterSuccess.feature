Feature: Register a new user via the API

  Scenario: Successfully register a new user
    Given the API endpoint "https://reqres.in/api/register"
    And the request body is:
      """
      {
          "email": "eve.holt@reqres.in",
          "password": "pistol"
      }
      """
    When I send a POST request
    Then the response status code should be 200
    And the response should match the expected schema "PostUserRegister-schema.json"



  Scenario Outline: Successfully register a new user
    Given the API endpoint "<endpoint>"
    And the request body is:
      """
      {
          "email": "<email>",
          "password": "<password>"
      }
      """
    When I send a POST request
    Then the response status code should be 200
    And the response should match the expected schema "<schema>"

    Examples:
      | endpoint                        | email                | password | schema                      |
      | https://reqres.in/api/register  | eve.holt@reqres.in   | pistol   | PostUserRegister-schema.json |


