@show_restaurant
Feature: Show Restaurant link or button available and accessible

  Scenario: User want to show restaurant detail
    Given user at homepage
    And the restaurant A exist
    When user want to see the restaurant A info detail
    Then user should see the restaurant A info
