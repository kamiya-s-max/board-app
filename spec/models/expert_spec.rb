require 'rails_helper'

RSpec.describe Expert, type: :model  do
  describe '#create' do
    context 'can save' do
      # name,text,career,contact,category全て揃った状態で投稿できる
      it "is valid with name,text,career,contact,category" do
        user = create(:user)
        category = create(:category)
        expect(build(:expert, user_id: user.id, category_id: category.id)).to be_valid
      end

      # contactが空でも投稿できる
      it "is valid without contact" do
        user = create(:user)
        category = create(:category)
        expect(build(:expert, contact: nil, user_id: user.id, category_id: category.id)).to be_valid
      end

      # textが空でも投稿できる
      it "is valid without text" do
        user = create(:user)
        category = create(:category)
        expect(build(:expert, text: nil, user_id: user.id, category_id: category.id)).to be_valid
      end

      # contactとtextが空でも投稿できる
      it "is valid without contact and text" do
        user = create(:user)
        category = create(:category)
        expect(build(:expert, contact: nil, text: nil, user_id: user.id, category_id: category.id)).to be_valid
      end
    end

    context 'can not save' do
      # nameが空では投稿できない
      it "is invalid without name" do
        user = create(:user)
        category = create(:category)
        expert = build(:expert, name: nil, user_id: user.id, category_id: category.id)
        expert.valid?
        expect(expert.errors[:name]).to include("can't be blank")
      end

      # careerが空では投稿できない
      it "is invalid without career" do
        user = create(:user)
        category = create(:category)
        expert = build(:expert, career: nil, user_id: user.id, category_id: category.id)
        expert.valid?
        expect(expert.errors[:career]).to include("can't be blank")
      end

      # category_idが空では投稿できない
      it "is invalid without category_id" do
        user = create(:user)
        category = create(:category)
        expert = build(:expert, user_id: user.id, category_id: nil)
        expert.valid?
        expect(expert.errors[:category]).to include("must exist")
      end

      # user_idが空では投稿できない
      it "is invalid without user_id" do
        category = create(:category)
        expert = build(:expert, user_id: nil, category_id: category.id)
        expert.valid?
        expect(expert.errors[:user])
      end
    end

  end
end