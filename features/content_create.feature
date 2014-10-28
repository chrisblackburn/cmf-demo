Feature: Create Content

  As an employee in one of our global teams
  I want to update content on a webpage, including a video and a presentation, quickly and easily
  And There is some copy that needs to be translated from English that must also be included

  Scenario: Include videos and presentations in content
    Given I create a piece of approved content including a video and a presentation
     When I view the content on the website
     Then I should see the video and the presentation

  Scenario: Localise content
    Given I create a piece of localised content in English and German
     Then I should be able to view the content on the website in English
      And I should be able to view the content on the website in German
