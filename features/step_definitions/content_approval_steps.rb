Given(/^I create a piece of content that is not yet approved$/) do
  create_user_and_login_cms
  create_cms_approver
  visit new_admin_content_path
  fill_in 'Title', with: 'Content needing approval'
  fill_in 'Content', with: 'Needs approval'
  click_button 'Create Content'
end

Then(/^I should not be able to see the content on the website$/) do
  expect {
    visit content_path(Content.first)
  }.to raise_error(ActiveRecord::RecordNotFound)
end

Then(/^the Approver should receive a notification to approve the content$/) do
  approver_email = AdminUser.find_by(approver: true).email
  sent_email = ActionMailer::Base.deliveries.last

  expect(sent_email.to).to include(approver_email)
  expect(sent_email.subject).to eq('Approve this content')
end

Given(/^I am logged in as an Approver$/) do
  create_cms_approver
  login_cms(:approver)
end

Given(/^I approve the content$/) do
  content = FactoryGirl.create(:content, approved_at: nil)
  visit edit_admin_content_path(content)
  click_link 'Approve'
end

Then(/^I should be able to see the content on the website$/) do
  visit content_path(Content.first)
  expect(page).to have_content(Content.first.title)
end
