Feature: Partially update a user via the API

  Scenario Outline: Successfully update an existing user partially
    Given the API endpoint "<apiEndpoint>"
    And the request body is:
      """
      {
          "name": "<name>",
          "job": "<job>"
      }
      """
    When I send a PATCH request
    Then the response status code should be 200
    And the response should match the expected schema "PatchUpdateUser-schema.json"

    Examples:
      | apiEndpoint                   | name      | job            |
      | https://reqres.in/api/users/2 | morpheus  | zion resident  |
      | https://reqres.in/api/users/3 | trinity   | matrix guardian |
      | https://reqres.in/api/users/4 | neo       | the one        |
