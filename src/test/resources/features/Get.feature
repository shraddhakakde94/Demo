Feature: Retrieve Users from ReqRes API

  Scenario: Retrieve users from page 2
    Given the API endpoint "https://reqres.in/api/users?page=2"
    When I send a GET request
    Then the response status code should be 200
