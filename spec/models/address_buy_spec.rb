require 'rails_helper'

RSpec.describe AddressBuy, type: :model do
  before do
    @address_buy = FactoryBot.build(:address_buy)
  end

  describe '商品購入' do
    context "購入がうまくいく場合" do
      it "token、郵便番号、県、市町村、番地、電話番号があれば保存ができること" do
        expect(@address_buy).to be_valid
      end
      it "建物名がなくて保存ができること" do
        @address_buy.building_name = ''
        expect(@address_buy).to be_valid
      end
    end

    context "購入がうまくいかない場合" do
      it "tokenが空では登録できないこと" do
        @address_buy.token = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では保存ができないこと" do
        @address_buy.postal_code = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンが使われていないと保存ができないこと" do
        @address_buy.postal_code = '123 4567'
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Postal code dosen't use Hyphen")
      end
      it "県名が選択されていないと保存ができないこと" do
        @address_buy.prefecture_id = 1
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Prefecture dosen't selected")
      end
      it "市町村が空では保存ができないこと" do
        @address_buy.municipality = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空では保存ができないこと" do
        @address_buy.address = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では保存ができないこと" do
        @address_buy.phone_number = ''
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にハイフンが使われていると保存ができないこと" do
        @address_buy.phone_number = '123-4567-8901'
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Phone number can't use Hyphen and Alphanumeric characters")
      end
      it "電話番号が英数混同だと保存ができないこと" do
        @address_buy.phone_number = '090aaaa1111'
        @address_buy.valid?
        expect(@address_buy.errors.full_messages).to include("Phone number can't use Hyphen and Alphanumeric characters")
      end

    end
  end
end
