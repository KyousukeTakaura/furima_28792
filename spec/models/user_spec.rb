require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
    it "nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birth_dayが存在する時、登録できる" do
      expect(@user).to be_valid
    end
    it "first_nameが全角の時、登録できる" do
      @user.first_name="司"
      expect(@user).to be_valid
    end
    it "family_nameが全角の時、登録できる" do
      @user.family_name="道明寺"
      expect(@user).to be_valid
    end
    it "first_name_kanaが全角カタカナの時、登録できる" do
      @user.first_name_kana="ツカサ"
      expect(@user).to be_valid
    end
    it "family_name_kanaが全角カタカナの時、登録できる" do
      @user.first_name_kana="ドウミョウジ"
      expect(@user).to be_valid
    end
    it "passwordが6文字以上の時、登録できる" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
    end
   end
    context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordとpassword_confirmationがマッチしないと登録できない" do
      @user.password_confirmation = "1234567"
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dayが空だと登録できない" do
      @user.birth_day= ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "passeordが５文字以下の時、登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "重複したemailが存在する時、登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "first_nameが全角ではない時、登録できない" do
      @user.first_name = "tsukasa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end
    it "family_nameが全角ではない時、登録できない" do
      @user.family_name = "doumyouzi"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name は全角で入力してください。")
    end
    it "first_name_kanaが全角カタカナではない時、登録できない" do
      @user.first_name_kana = "司"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
    end
    it "family_name_kanaが全角カタカナではない時、登録できない" do
      @user.family_name_kana= "道明寺"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana は全角カタカナで入力して下さい。")
    end
   end 
  end
end
