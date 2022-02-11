require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item=FactoryBot.build(:item)
  end

  describe '既存食品の記述ページ' do
    context "入力した情報が保存できるとき" do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
      it 'thing(食品名)が20文字以内なら保存できる' do
        @item.thing='アーリオオーリオペペロンチーノの素'
        expect(@item).to be_valid
      end
      it 'explanationが空でも保存できる' do
        @item.explanation=''
        expect(@item).to be_valid
      end
      it 'explationが100文字以下なら保存できる' do
        @item.explanation='1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
        expect(@item).to be_valid
      end
    end

    context "入力した情報が保存できないとき" do
      it 'thing(商品名)が空だと保存できない' do
        @item.thing=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Food can't be blank")
      end
      it 'thing(商品名)が20文字を超えると保存できない' do
        @item.thing='アーーリオオーーリオぺぺぺぺロンチーーノー'
        @item.valid?
        expect(@item.errors.full_messages).to include("Food is too long (maximum is 20 characters)")
      end
      it 'category_idが空(1)だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'expiryが空だと保存できない' do
        @item.expiry=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Expiry date can't be blank")
      end
      it 'explanationが100文字を超えると保存できない' do
        @item.explanation='12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901'
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 100 characters)")
      end
      it 'ユーザー情報がない場合は保存できない' do
        @item.user=nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end


