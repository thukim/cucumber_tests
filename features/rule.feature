Feature: Rule Sample

  Rule: This is a rule

    Scenario: A flaky example
      Given this will be flaky
      When I do an action
      Then some results should be there

    Scenario: A passed example
      Given this will pass
      When I do an action
      Then some results should be there
