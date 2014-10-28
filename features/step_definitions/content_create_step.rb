Given(/^I create a piece of approved content including a video and a presentation$/) do
  create_user_and_login_cms
  visit new_admin_content_path
  fill_in 'Title', with: 'Test Article'
  fill_in 'content_translations_attributes_1_content', with: sir_trevor_container([sir_trevor_video, sir_trevor_embed])
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

Given(/^I create a piece of localised content in English and German$/) do
  create_user_and_login_cms
  visit new_admin_content_path
  fill_in 'Title', with: 'Test Article'
  fill_in 'content_translations_attributes_0_content', with: sir_trevor_container([sir_trevor_text('German')])
  fill_in 'content_translations_attributes_1_content', with: sir_trevor_container([sir_trevor_text('English')])
  click_button 'Create Content'

  Content.first.approve!
end

Then(/^I should be able to view the content on the website in English$/) do
  visit content_path(Content.first, locale: 'en')
  expect(page).to have_content('English')
end

Then(/^I should be able to view the content on the website in German$/) do
  visit content_path(Content.first, locale: 'de')
  expect(page).to have_content('German')
end
