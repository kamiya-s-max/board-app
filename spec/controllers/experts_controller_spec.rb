require 'rails_helper'

describe ExpertsController do
  let(:category) { create(:category)}
  let(:user) {create(:user)}

  describe "#index" do

    # @categoryが存在しているか確認
    it "assigns @category" do
      get :index, params: { category_id: category.id }
      expect(assigns(:category)).to eq category
    end
    # indexのビューが描画されるか
    it "renders index" do
      get :index, params: { category_id: category.id }
      expect(response).to render_template :index
    end
  end

  describe "#create" do
    let(:params) {{expert: attributes_for(:expert, category_id: category.id, user_id: user.id)}}
    context "login" do
      before do
        login user
      end

      context "can save" do
        subject {
          post :create, params: params
        }
        # expertが保存されたか確認
        it "count up expert" do
          expect{ subject }.to change(Expert, :count).by(1)
        end
        # 該当カテゴリのindexにリダイレクトするか確認
        it "redirect to category_experts_path" do
          subject
          expect(response).to redirect_to(category_experts_path(category))
        end
      end

      context "can not save" do
        let(:invalid_params) {{expert: attributes_for(:expert, name: nil, category_id: category.id, user_id: user.id)}}
        subject {
          post :create, params: invalid_params
        }
        # expertが保存されていないか確認
        it "does not count up" do
          expect{ subject }.not_to change(Expert, :count)
        end
        # newアクション画面を描画するか確認
        it "render new" do
          subject
          expect(response).to render_template :new
        end
      end
    end

    context "not login" do
      # ログインしてなければログイン画面にリダイレクトされるか
      it "redirect to new_user_session_path" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end