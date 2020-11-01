class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buy_controls

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } 
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } 
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
    validates :email, format: { with: /@.+/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i }
    validates :birthday
  end
  
end

