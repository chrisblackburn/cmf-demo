Given(/^I create a piece of approved content including a video and a presentation$/) do
  create_user_and_login_cms
  visit new_admin_content_path
  fill_in 'Title', with: 'Test Article'
  fill_in 'Content', with: sir_trevor_container([sir_trevor_video, sir_trevor_embed])
  click_button 'Create Content'

  Content.first.approve!
end

When(/^I view the content on the website$/) do
  visit content_path(Content.first)
end

Then(/^I should see the video and the presentation$/) do
  expect(page).to have_xpath('//iframe[@src="//www.youtube.com/embed/wG2C3JbaaUo"]')
  expect(page).to have_xpath('//iframe[@src="//www.slideshare.net/slideshow/embed_code/40665069"]')
end
