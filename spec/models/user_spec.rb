require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email =''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスに@が無いと登録出来ない'do
      @user.email ="1aaaaaa"  
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが全角では登録できない' do
      @user.password = 'ＡＡＡ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが、数字だけの場合は登録出来ない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが、英語だけの場合は登録出来ない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
   
    it 'password_confirmationが空だと登録出来ない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = '1234asdf'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '名字が空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it '名前が空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it 'ユーザー本名(名字)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.lastname = 'a1a1a1a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end

    it 'ユーザー本名（名前）は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.firstname = 'a11a1a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end

    it '名字のフリガナが空では登録できない' do
      @user.lastkana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastkana can't be blank")
    end

    it '名前のフリガナが空では登録できない' do
      @user.firstkana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstkana can't be blank")
    end

   it 'ユーザー本名のフリガナ(名字)は、全角（カタカナ）での入力が必須であること' do
      @user.lastname = 'a1a1a1a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid")
    end

   it 'ユーザー本名のフリガナは（名前）、全角（カタカナ）での入力が必須であること' do
      @user.firstname = 'a11a1a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end

    it '生年月日が空では登録できない' do
      @user.birthday= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end










end





