FactoryBot.define do
  factory :agenda do
    name { 'テストテーマ' }
    opinion { 1 }
    user
  end
end
