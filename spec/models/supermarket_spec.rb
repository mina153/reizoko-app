require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  before do
    @supermarket=FactoryBot.build(:supermarket)
  end

  describe 'スーパーマーケットの記述ページ' do
    context "入力した情報が保存できるとき" do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@supermarket).to be_valid
      end
      it 'market_urlが空でも保存できる' do
        @supermarket.market_url=''
        expect(@supermarket).to be_valid
      end
      it 'detail(説明)が空でも保存できる' do
        @supermarket.detail=''
        expect(@supermarket).to be_valid
      end
    end

    context "入力した情報が保存できないとき" do
      it 'market(スーパーの名前)が空だと保存できない' do
        @supermarket.market=''
        @supermarket.valid?
        expect(@supermarket.errors.full_messages).to include("Supermarket name can't be blank")
      end
      it 'market(スーパーの名前)が20文字を超えると保存できない' do
        @supermarket.market='アーーリオオーーリオぺぺぺぺロンチーーノー'
        @supermarket.valid?
        expect(@supermarket.errors.full_messages).to include("Supermarket name is too long (maximum is 20 characters)")
      end
      it 'detailが100文字を超えると保存できない' do
        @supermarket.detail='12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901'
        @supermarket.valid?
        expect(@supermarket.errors.full_messages).to include("Detail is too long (maximum is 100 characters)")
      end
      it 'ユーザー情報がない場合は保存できない' do
        @supermarket.user= nil
        @supermarket.valid?
        expect(@supermarket.errors.full_messages).to include("User must exist")
      end
    end
  end
end
