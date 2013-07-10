@multiple_categories
Feature: Restaurant can assign to multiple categories

  Scenario: Owner can assign multiple categories to restaurant
    Given owner at homepage
    And the restaurant X exist
    And the category A exist
    And the category B exist
    When owner want to assign multiple categories
    Then the restaurant categories should be updated
