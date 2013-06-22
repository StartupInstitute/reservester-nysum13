@delete_restaurant
Feature: Delete Restaurant link or button available and accessible

  Scenario: User want to delete existing restaurant
    Given user at homepage
    And the restaurant A exist
    And user want to delete the restaurant A
    When user delete restaurant A info
    Then the restaurant A should be deleted
