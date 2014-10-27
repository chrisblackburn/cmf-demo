FactoryGirl.define do
  factory :dataset do
    discloser_name { Faker::Name.name }
    disclosure_score { [*0..100].sample }
    gics_sector { ['Industrials', 'Utilities', 'Energy'].sample }
    gics_industry_group { ['Capital Goods', 'Utilities', 'Materials'].sample }
    gics_industry { ['Machinery', 'Containers and Packaging', 'Electrical Equipment'].sample }
    gics_sub_industry { ['Industrial Machinery', 'Electric Utilities', 'Metal & Glass Containers'].sample }
  end
end
