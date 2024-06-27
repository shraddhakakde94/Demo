Feature: Create a new user via the API

  Scenario: Successfully create a new user
    Given the API endpoint "https://reqres.in/api/users"
    And the request body is:
      """
      {
          "name": "morpheus",
          "job": "leader"
      }
      """
    When I send a POST request
    Then the response status code should be 201
    And the response should match the expected schema "PostCreateUser-schema.json"




  Scenario Outline: Create multiple new users via the API
    Given the API endpoint "https://reqres.in/api/users"
    And the request body is:
      """
      {
          "name": "<name>",
          "job": "<job>"
      }
      """
    When I send a POST request
    Then the response status code should be 201
    And the response should match the expected schema "PostCreateUser-schema.json"

    Examples:
      | name     | job       |
      | morpheus | leader    |
      | neo      | the one   |
      | trinity  | hacker    |
