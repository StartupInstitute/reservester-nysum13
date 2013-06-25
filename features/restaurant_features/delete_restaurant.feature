@delete_restaurant
Feature: Delete Restaurant link or button available and accessible

  Scenario: User want to delete existing restaurant
    Given owner at homepage
    And the restaurant A exist
    And owner want to delete the restaurant A
    When owner delete restaurant A info
    Then the restaurant A should be deleted
