Given(/^I have imported a dataset$/) do
  FactoryGirl.create_list(:dataset, 20)
end

Then(/^I should be able to see the dataset on the website$/) do
  visit dataset_path
  expect(page).to have_content(Dataset.first.discloser_name)
  expect(page).to have_content(Dataset.second.discloser_name)
end
