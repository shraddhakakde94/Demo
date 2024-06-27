Feature: Retrieve Users from ReqRes API

  Scenario Outline: Validate response schema for users
    Given the API endpoint "<endpoint>"
    When I send a GET request
    Then the response status code should be 200
    And the response should match the expected schema "<schemaFilePath>"

    Examples:
      | endpoint                           | schemaFilePath       |
      | https://reqres.in/api/users?page=2 | Getuserslist-schema.json |


  Scenario Outline: Validate response schema for a single user
    Given the API endpoint "<endpoint>"
    When I send a GET request
    Then the response status code should be <statusCode>
    And the response should match the expected schema "<schemaFilePath>"

    Examples:
      | endpoint                        | schemaFilePath            |statusCode|
      | https://reqres.in/api/users/2   | GetSingleUser-schema.json |200       |
      | https://reqres.in/api/users/23  |                           |404      |

