Feature: Content Embargo

  As a member of the communications’ team
  I need to release information at 12.01am (GMT) on Monday morning
  And for it to be removed at 11.59pm (GMT) on Friday night

  Scenario: Embargo publishing
    Given I create a piece of content set to go live in 1 day from now
     Then I should not be able to see the content on the website
      But In 1 day from now I should be able to see the content on the website

  Scenario: Expired content
    Given I create a piece of content set to go dark in 1 day from now
     Then I should be able to see the content on the website
      But In 1 day from now I should not be able to see the content on the website
