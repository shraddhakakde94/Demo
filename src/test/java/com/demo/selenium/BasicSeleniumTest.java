package com.demo.selenium;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class BasicSeleniumTest {
    private static WebDriver driver;

    @BeforeClass
    public static void setUp() {
        // Set the path to the ChromeDriver executable
       // System.setProperty("webdriver.chrome.driver", "path/to/chromedriver");

        // Initialize the ChromeDriver instance
        driver = new ChromeDriver();
    }

    @Test
    public void testSeleniumDemo() {
        // Navigate to a web page
        driver.get("https://google.com");

    }

    @AfterClass
    public static void tearDown() {
        // Close the browser and quit the WebDriver
        driver.quit();
    }
}