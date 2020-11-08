class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buy_controls

  zenkaku_validate = { with: /\A[ぁ-んァ-ン一-龥]/, message: 'does not Zenkaku' }
  zenkaku_kana_validate = { with: /\A[ァ-ヶー－]+\z/, message: 'does not Zenkaku Kana' }

  with_options presence: true do
    validates :nickname
    validates :family_name, format: zenkaku_validate
    validates :first_name, format: zenkaku_validate
    validates :family_name_kana, format: zenkaku_kana_validate
    validates :first_name_kana, format: zenkaku_kana_validate
    validates :email, format: { with: /@.+/, message: 'does not have @ mark' }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i, message: 'too short (minimum is 6 characters)', message:'is not a mixture of Half-width alphanumeric characters' }
    validates :birthday
  end
  
end

