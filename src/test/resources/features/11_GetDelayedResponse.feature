Feature: Retrieve Delayed Users from ReqRes API

  Scenario Outline: Validate delayed response schema for users
    Given the API endpoint "<endpoint>"
    When I send a GET request
    Then the response status code should be 200
    And the response should match the expected schema "<schemaFilePath>"

    Examples:
      | endpoint                               | schemaFilePath             |
      | https://reqres.in/api/users?delay=3     | GetDelayedUsers-schema.json |

