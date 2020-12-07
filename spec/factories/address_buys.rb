FactoryBot.define do
  factory :address_buy do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 35 }
    municipality  { '広島市' }
    address       { '1-1-1' }
    building_name { '建物ビル' }
    phone_number  { '09012345678' }
  end
end
