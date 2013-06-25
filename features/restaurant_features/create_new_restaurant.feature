@create_new_restaurant
Feature: New Restaurant link or button available and accessible

  Scenario: Owner want to create new restaurant
    Given owner at homepage
    When owner create new restaurant
    And owner fill up the restaurant info
    Then new restaurant should be created

