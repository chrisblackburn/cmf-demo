Given(/^I create a piece of approved content$/) do
  create_user_and_login_cms
  visit new_admin_content_path
  fill_in 'Title', with: 'My Job'
  fill_in 'Content', with: 'Why not apply for this job?'
  click_button 'Create Content'

  Content.first.approve!
end

Then(/^I should see social sharing links$/) do
  expect(page).to have_xpath('//iframe[contains(@src, "//www.facebook.com/plugins/like.php")]')
  expect(page).to have_xpath('//a[@href="https://twitter.com/share"]')
end
