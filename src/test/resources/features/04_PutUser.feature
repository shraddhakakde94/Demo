Feature: Update a user via the API

  Scenario: Update a user via the API, Successfully update an existing user
    Given the API endpoint "https://reqres.in/api/users/2"
    And the request body is:
      """
      {
          "name": "morpheus",
          "job": "zion resident"
      }
      """
    When I send a PUT request
    Then the response status code should be 200
    And the response should match the expected schema "PutUpdateUser-schema.json"


  Scenario Outline: Update multiple users via the API, Successfully update an existing user
    Given the API endpoint "<apiEndpoint>"
    And the request body is:
      """
      {
          "name": "<name>",
          "job": "<job>"
      }
      """
    When I send a PUT request
    Then the response status code should be 200
    And the response should match the expected schema "PutUpdateUser-schema.json"

    Examples:
      | apiEndpoint                   | name      | job            |
      | https://reqres.in/api/users/2 | morpheus  | zion resident  |
      | https://reqres.in/api/users/3 | trinity   | hacker         |
      | https://reqres.in/api/users/4 | neo       | the one        |
