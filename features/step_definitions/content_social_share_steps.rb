Given(/^I create a piece of approved content$/) do
  FactoryGirl.create(:content,
    approved_at: Time.now
  )
end

Then(/^I should see social sharing links$/) do
  expect(page).to have_xpath('//iframe[contains(@src, "//www.facebook.com/plugins/like.php")]')
  expect(page).to have_xpath('//a[@href="https://twitter.com/share"]')
end
