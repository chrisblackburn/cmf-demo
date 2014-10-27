Given(/^I create a piece of approved content including a video and a presentation$/) do
  create_user_and_login_cms
  visit new_admin_content_path
  fill_in 'Title', with: 'Test Article'
  fill_in 'Content', with: <<-EOS
    <iframe width="560" height="315" src="//www.youtube.com/embed/GwB2rqSwSzY?rel=0" frameborder="0" allowfullscreen></iframe>
    <iframe src="//www.slideshare.net/slideshow/embed_code/19059032" width="425" height="355" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" allowfullscreen></iframe>
  EOS
  click_button 'Create Content'

  Content.first.approve!
end

When(/^I view the content on the website$/) do
  visit content_path(Content.first)
end

Then(/^I should see the video and the presentation$/) do
  expect(page).to have_xpath('//iframe[@src="//www.youtube.com/embed/GwB2rqSwSzY?rel=0"]')
  expect(page).to have_xpath('//iframe[@src="//www.slideshare.net/slideshow/embed_code/19059032"]')
end
