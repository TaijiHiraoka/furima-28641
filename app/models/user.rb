class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buy_controls

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'does not Zenkaku' } 
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'does not Zenkaku' } 
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'does not Zenkaku Kana' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'does not Zenkaku Kana' }
    validates :email, format: { with: /@.+/, message: 'too short (minimum is 6 characters)' }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i }
    validates :birthday
  end
  
end

