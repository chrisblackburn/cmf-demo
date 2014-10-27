Given(/^I create a piece of content set to go live in (\d+) day from now$/) do |num_days|
  FactoryGirl.create(:content,
    live_from: num_days.days.from_now,
    approved_at: Time.now
  )
end

Then(/^In (\d+) day from now I should be able to see the content on the website$/) do |num_days|
  Timecop.travel(num_days.days.from_now)
  visit content_path(Content.first)
  expect(page).to have_content(Content.first.title)
end

Given(/^I create a piece of content set to go dark in (\d+) day from now$/) do |num_days|
  FactoryGirl.create(:content,
    live_to: num_days.days.from_now,
    approved_at: Time.now
  )
end

Then(/^In (\d+) day from now I should not be able to see the content on the website$/) do |num_days|
  Timecop.travel(num_days.days.from_now)
  expect {
    visit content_path(Content.first)
  }.to raise_error(ActiveRecord::RecordNotFound)
  Timecop.return
end
