FactoryBot.define do
  factory :note do
    content { "Sample note content" }
    association :user
  end
end