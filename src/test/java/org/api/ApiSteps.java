package org.api;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.module.jsv.JsonSchemaValidator;
import io.restassured.http.ContentType;

import static org.junit.Assert.assertEquals;

public class ApiSteps {

    private String apiUrl;
    private String requestBody;
    private Response response;

    @Given("the API endpoint {string}")
    public void setApiUrl(String endpoint) {
        apiUrl = endpoint;
    }

    @Given("the request body is:")
    public void the_request_body_is(String docString) {
        requestBody = docString;
    }

    @When("I send a POST request")
    public void i_send_a_post_request() {
        response = RestAssured.given()
                .contentType(ContentType.JSON)
                .body(requestBody)
                .post(apiUrl);
    }

    @When("I send a GET request")
    public void sendGetRequest() {
        response = RestAssured.get(apiUrl);
    }

    @When("I send a PUT request")
    public void sendPutRequest() {
        response = RestAssured.given()
                .contentType(ContentType.JSON)
                .body(requestBody)
                .put(apiUrl);
    }

    @When("I send a PATCH request")
    public void sendPatchRequest() {
        response = RestAssured.given()
                .contentType(ContentType.JSON)
                .body(requestBody)
                .patch(apiUrl);
    }

    @When("I send a DELETE request")
    public void sendDeleteRequest() {
        response = RestAssured.delete(apiUrl);
    }

    @Then("the response status code should be {int}")
    public void verifyStatusCode(int expectedStatusCode) {
        assertEquals("Unexpected status code", expectedStatusCode, response.getStatusCode());
    }

    @Then("the response should match the expected schema {string}")
    public void verifyResponseMatchesSchema(String schemaFileName) {
        if (!schemaFileName.isEmpty()) {
            response.then().assertThat().body(JsonSchemaValidator.matchesJsonSchemaInClasspath("schemas/" + schemaFileName));
        } else {
            System.out.println("No schema validation needed for empty response or 404.");
        }
    }

    @Then("the response should match the expected error schema {string}")
    public void verifyResponseMatchesErrorSchema(String schemaFileName) {
        if (!schemaFileName.isEmpty()) {
            response.then().assertThat().body(JsonSchemaValidator.matchesJsonSchemaInClasspath("schemas/" + schemaFileName));
        } else {
            System.out.println("No schema validation needed for empty schema file.");
        }
    }
}
