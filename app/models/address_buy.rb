class AddressBuy
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "dosen't use Hyphen" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: "is 11 digits or less" }
  end

  with_options numericality: { other_than: 1, message: "dosen't selected" } do
    validates :prefecture_id
  end

  def save
    # user = User.create(nickname: nickname, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, email: email, password: password, birthday: birthday)
    # item = Item.create(image: image, name: name, description: description, price: price, category_id: category_id, condition_id: condition_id, send_cost_id: send_cost_id, prefecture_id: prefecture_id, send_day_id: send_day_id)
    buy_control = BuyControl.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buy_control_id: buy_control.id)
  end

end