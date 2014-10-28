Given(/^I create a piece of approved content with a PDF, video and infographic$/) do
  create_user_and_login_cms
  visit new_admin_content_path
  fill_in 'Title', with: 'Content needing approval'
  fill_in 'content_translations_attributes_1_content',
    with: sir_trevor_container([sir_trevor_video, sir_trevor_image, sir_trevor_file])
  click_button 'Create Content'

  Content.first.approve!
end

Then(/^I should see tracking events attached to each piece of content$/) do
  expect(page.html).to have_content('tracking video play')
  expect(page.html).to have_content('tracking video end')
end
