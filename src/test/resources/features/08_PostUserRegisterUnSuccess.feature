Feature: Error handling for missing password during user registration

  Scenario: Receive error response for missing password
    Given the API endpoint "https://reqres.in/api/register"
    And the request body is:
      """
      {
          "email": "sydney@fife"
      }
      """
    When I send a POST request
    Then the response status code should be 400
    And the response should match the expected error schema "PostUserMissingPassword-error-schema.json"


  Scenario Outline: Receive error response for missing password
    Given the API endpoint "<endpoint>"
    And the request body is:
      """
      {
          "email": "<email>"
      }
      """
    When I send a POST request
    Then the response status code should be 400
    And the response should match the expected error schema "<errorSchema>"

    Examples:
      | endpoint                        | email           | errorSchema                      |
      | https://reqres.in/api/register  | sydney@fife     | PostUserMissingPassword-error-schema.json |