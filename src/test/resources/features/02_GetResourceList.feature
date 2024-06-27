Feature: Validate response schema for unknown resource from ReqRes API

  Scenario Outline: Validate response schema for unknown resource
    Given the API endpoint "<endpoint>"
    When I send a GET request
    Then the response status code should be <statusCode>
    And the response should match the expected schema "<schemaFilePath>"

    Examples:
      | endpoint                          | statusCode | schemaFilePath              |
      | https://reqres.in/api/unknown      | 200        | GetResourceList-schema.json |



  Scenario Outline: Validate response schema for a single color resource
    Given the API endpoint "<endpoint>"
    When I send a GET request
    Then the response status code should be <statusCode>
    And the response should match the expected schema "<schemaFilePath>"

    Examples:
      | endpoint                       | statusCode | schemaFilePath                 |
      | https://reqres.in/api/unknown/2 | 200        | GetSingleResource-schema.json |
      | https://reqres.in/api/unknown/23 | 404        |                              |


