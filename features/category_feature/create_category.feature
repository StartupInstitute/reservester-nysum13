@create_category
Feature: New category available and accessible

  Scenario: Admin can create category
    Given admin at homepage
    When admin create new category
    And admin fill up the category info
    Then new category should be created