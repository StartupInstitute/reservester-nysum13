@show_restaurant
Feature: Show Restaurant link or button available and accessible

  Scenario: User want to show restaurant detail
    Given owner at homepage
    And the restaurant A exist
    When owner want to see the restaurant A info detail
    Then owner should see the restaurant A info
