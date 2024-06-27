Feature: User login via the API

  Scenario Outline: Successfully log in with valid credentials
    Given the API endpoint "https://reqres.in/api/login"
    And the request body is:
      """
      {
          "email": "<email>",
          "password": "<password>"
      }
      """
    When I send a POST request
    Then the response status code should be 200
    And the response should match the expected schema "UserLogin-success-schema.json"

    Examples:
      | email                 | password    |
      | eve.holt@reqres.in    | cityslicka  |
      | charles.morris@reqres.in | lorem      |
      | tracey.ramos@reqres.in   | ipsum      |
