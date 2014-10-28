Feature: Track content popularity

  As a CDP employee
  I would like to track the popularity of content on the site

  Scenario: Track content popularity
    Given I create a piece of approved content with a PDF, video and infographic
     When I view the content on the website
     Then I should see tracking events attached to each piece of content
