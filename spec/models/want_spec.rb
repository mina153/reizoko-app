require 'rails_helper'

RSpec.describe Want, type: :model do
  before do
    @want=FactoryBot.build(:want)
  end

  describe '欲しい食品の記述ページ' do
    context "入力した情報が保存できるとき" do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@want).to be_valid
      end
      it 'account(説明)が空でも保存できる' do
        @want.account=''
        expect(@want).to be_valid
      end
    end

    context "入力した情報が保存できないとき" do
      it 'wanted(商品名)が空だと保存できない' do
        @want.wanted=''
        @want.valid?
        expect(@want.errors.full_messages).to include("Food can't be blank")
      end
      it 'wanted(商品名)が20文字を超えると保存できない' do
        @want.wanted='アーーリオオーーリオぺぺぺぺロンチーーノー'
        @want.valid?
        expect(@want.errors.full_messages).to include("Food is too long (maximum is 20 characters)")
      end
      it 'categori_idが空(1)だと保存できない' do
        @want.categori_id = 1
        @want.valid?
        expect(@want.errors.full_messages).to include("Category can't be blank")
      end
      it 'accountが100文字を超えると保存できない' do
        @want.account='12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901'
        @want.valid?
        expect(@want.errors.full_messages).to include("Account is too long (maximum is 100 characters)")
      end
      it 'ユーザー情報がない場合は保存できない' do
        @want.user= nil
        @want.valid?
        expect(@want.errors.full_messages).to include("User must exist")
      end
      it 'スーパーマーケット情報がない場合は保存できない' do
        @want.supermarket= nil
        @want.valid?
        expect(@want.errors.full_messages).to include("Supermarket must exist")
      end
    end
  end
end
