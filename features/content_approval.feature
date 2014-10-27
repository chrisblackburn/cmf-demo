Feature: Submit content for approval

  As a CDP employee
  I want to create a webpage, build it and submit it for approval

  Scenario: Do not show until approved
    Given I create a piece of content that is not yet approved
     Then I should not be able to see the content on the website
      And the Approver should receive a notification to approve the content

  Scenario: Approve content
    Given I am logged in as an Approver
      And I approve the content
     Then I should be able to see the content on the website
