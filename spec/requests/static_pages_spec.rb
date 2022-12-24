require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  before do 
    driven_by :selenium_chrome_headless
  end
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
