require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id,item_id: item.id)
    sleep 0.3
  end
  context '購入できるとき' do
    it '正常な値が入力されているときには購入できる' do
      expect(@buy_address).to be_valid
    end

    it '建物名が入力されていなくても購入できる' do
      @buy_address.buildingname = ''
      expect(@buy_address).to be_valid
    end


  end

  context '購入できないとき' do

    it '郵便番号が入力されていないと購入出来ない' do
      @buy_address.postal = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal can't be blank")
    end

    it '都道府県が選ばれていないと購入出来ない' do
      @buy_address.prefecture_id = 1
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '市区町村が入力されていないと購入出来ない' do
      @buy_address.municipalities = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Municipalities can't be blank")
    end

    it '番地が入力されていないと購入出来ない' do
      @buy_address.address = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が入力されていないと購入出来ない' do
      @buy_address.phone = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
    end

    it '郵便番号の保存にはハイフンがないと購入出来ない' do
      @buy_address.postal = '1234567'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
    end

    it '電話番号が11桁以内の数値でないと購入出来ない' do
      @buy_address.phone = '123456789012'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
    end
    
    it '電話番号が半角英数字混合だと購入出来ない' do
      @buy_address.phone = 'aa123456789'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone is invalid")
    end

    it '電話番号全角数字だと購入出来ない' do
      @buy_address.phone = '１２３４５６７８９０'
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Phone is invalid")
    end

    it 'ユーザー情報が入力されていないと購入出来ない' do
      @buy_address.user_id = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("User can't be blank")
    end
    
    it '商品情報が入力されていないと購入出来ない' do
      @buy_address.item_id = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Item can't be blank")
    end

    it "tokenが空では購入出来ない" do
      @buy_address.token = ''
      @buy_address.valid?
      expect(@buy_address.errors.full_messages).to include("Token can't be blank")
    end

  end

end
