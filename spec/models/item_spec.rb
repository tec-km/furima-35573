require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 context '出品できないとき' do
   it '商品画像を1枚つけないと出品できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
   end

   it '商品名が空では出品できない' do
    @item.title = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
   end

   it '商品の説明が空では出品できない' do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
   end

   it 'カテゴリーの情報が空では出品できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
   end

   it '商品の状態についての情報が空では出品できない' do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
   end

   it '配送料の負担についての情報が空では出品できない' do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping can't be blank")
   end

   it '発送元の地域についての情報が空では出品できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
   end

   it '発送までの日数についての情報が空では出品できない' do
    @item.day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Day can't be blank")
   end

   it '販売価格についての情報が空では出品できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
   end

  it '販売価格が299以下だと出品出来ない' do
    @item.price = '200'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
   end

   it '販売価格が10000000だと出品出来ない' do
    @item.price = '20000000'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
   end

   it '販売価格は半角数字のみでないと出品できない' do
    @item.price = '１００００００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
   end

   it 'ユーザーと紐付いていないと出品できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
   end

 context '出品できるとき' do
   it '必要な情報を適切に入力すると、商品情報がデータベースに保存される' do
    expect(@item).to be_valid
   end

 end

end

end

