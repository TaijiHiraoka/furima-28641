require 'rails_helper'

RSpec.describe Item, type: :model do
# describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context "商品出品がうまくいく場合" do
      it "商品画像、商品名、商品説明、商品価格、商品カテゴリー、商品状態、発送地域、送料、発送日時があると登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品がうまくいかない場合" do
      it "商品画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明がないと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "商品価格がないと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "商品価格が半角数字でないと登録できない" do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price isn't Half-width number")
      end
      it "商品価格が¥300以上でないと登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of range (¥300~9,999,999)")
      end
      it "商品価格が¥9,999,999以下でないと登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of range (¥300~9,999,999)")
      end
      it "商品カテゴリーが選択されていないと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category dosen't selected")
      end
      it "商品コンディションが選択されていないと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition dosen't selected")
      end
      it "送料が選択されていないと登録できない" do
        @item.send_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send cost dosen't selected")
      end
      it "都道府県が選択されていないと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture dosen't selected")
      end
      it "発送日が選択されていないと登録できない" do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day dosen't selected")
      end
    end
  end
end
