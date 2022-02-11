require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
      it 'emailが@を含めば登録できる' do
        @user.email= 'test@test.com'
        expect(@user).to be_valid
      end
      it 'nicknameが10文字以下なら登録できる' do
        @user.nickname='testtestte'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password='123456'
        @user.password_confirmation='123456'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password='123456'
        @user.password_confirmation='123456'
        expect(@user).to be_valid
      end
    end


    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが全角では登録できない' do
        @user.email='１２３＠１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailが同じだと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email=@user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailが@を含まないと登録できない' do
        @user.email='testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password='12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      # password記入欄は、自動的に半角しか入れられない設定になるから、テストコードなし

      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password='123456'
        @user.password_confirmation='234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
    end
  end
end


