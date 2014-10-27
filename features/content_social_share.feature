Feature: Social share content

  As a CDP employee
  I want to post a new job in my department and share it through social media channels following approval

  Scenario: Provide social sharing links
    Given I create a piece of approved content
     When I view the content on the website
     Then I should see social sharing links
