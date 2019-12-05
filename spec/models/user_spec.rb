require 'rails_helper'
describe User do
  describe '#create' do
    # nickname、email、password、password_confirmationがある場合に登録できる
    it "is valid with a nickname, email, password, password_confirmation"  do
      user = build(:user)
      expect(user).to be_valid
    end

    # nicknameが空では登録できない
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # emailが空では登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できない
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordがあってもpassword_confirmationが空であれば登録できない
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # nicknameが11文字以上であれば登録できない
    it "is invalid with a nickname that has more than 11 characters" do
      user = build(:user, nickname: "abcdefghijk")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 10 characters)")
    end

    # nicknameが10文字以下であれば登録できる
    it "is valid with a nickname that has less than 10 characters" do
      user = build(:user, nickname: "abcdefghij")
      expect(user).to be_valid
    end
    # 重複したnicknameであれば登録できない
    it "is invalid with a duplicate nickname" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end

    # 重複したemailであれば登録できない
    it "is invalid with a duplicate email" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが7文字以上であれば登録できる
    it "is valid with a password that has more than 7 characters" do
      user = build(:user, password: "abcd123", password_confirmation: "abcd123")
      user.valid?
      expect(user).to be_valid
    end

    # passwordが6文字以下であれば登録できない
    it "is invalid with a password that has less than 6 characters" do
      user = build(:user, password: "abcd12", password_confirmation: "abcd12")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end