require 'rails_helper'
describe TargetsController, type: :request do

  before do
    @target = FactoryBot.create(:target)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの目標にタイトルが存在する' do
      get root_path
      expect(response.body).to include(@target.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの目標に期日が存在する' do
      get root_path
      expect(response.body).to include(@target.deadline.strftime("%Y年%m月%d日"))
    end
  end

  describe 'GET #show'
end
# RSpec.describe "Targets", type: :request do
#   describe "GET /targets" do
#     it "works! (now write some real specs)" do
#       get targets_index_path
#       expect(response).to have_http_status(200)
#     end
#   end