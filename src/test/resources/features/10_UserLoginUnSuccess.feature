Feature: User login failure scenarios via the API

  Scenario: Error handling for missing password during login
    Given the API endpoint "https://reqres.in/api/login"
    And the request body is:
      """
      {
          "email": "peter@klaven"
      }
      """
    When I send a POST request
    Then the response status code should be 400
    And the response should match the expected error schema "UserLoginUnSuccess-error-schema.json"
