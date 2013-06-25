@edit_restaurant
Feature: Edit Restaurant link or button available and accessible

  Scenario: User want to edit existing restaurant
    Given owner at homepage
    And the restaurant A exist
    And owner want to edit the restaurant A info
    When owner edit restaurant A info
    Then the restaurant A info should be updated
