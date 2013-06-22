@create_new_restaurant
Feature: New Restaurant link or button available and accessible

  Scenario: User want to create new restaurant
    Given user at homepage
    When user create new restaurant
    And user fill up the restaurant info
    Then new restaurant should be created

