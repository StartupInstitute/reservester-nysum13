@edit_restaurant
Feature: Edit Restaurant link or button available and accessible

  Scenario: User want to edit existing restaurant
    Given user at homepage
    And the restaurant A exist
    And user want to edit the restaurant A info
    When user edit restaurant A info
    Then the restaurant A info should be updated
