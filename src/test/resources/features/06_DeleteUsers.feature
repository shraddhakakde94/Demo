Feature: Delete a user via the API

  Scenario Outline: Successfully delete an existing user
    Given the API endpoint "<apiEndpoint>"
    When I send a DELETE request
    Then the response status code should be 204

    Examples:
      | apiEndpoint                  |
      | https://reqres.in/api/users/2 |
      | https://reqres.in/api/users/3 |
      | https://reqres.in/api/users/4 |
