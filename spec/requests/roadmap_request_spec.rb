require 'rails_helper'

RSpec.describe 'Roadmaps', type: :request do
  context 'with registered & confirmed user but without a Rockmap' do
    it 'redirects user on sign in and signs out' do
      user = create(:confirmed_blank_user )
      sign_in user
      get root_path
      expect(response.status).to be 302

      sign_out user
      get root_path
      expect(response.status).to be 200
    end
  end

  describe 'GET /' do
    context 'when user is logged in' do

      before do
        @user = user_with_roadmap
        @roadmap = @user.roadmap
        sign_in @user
      end

      context 'with an associated Roadmap' do
        it 'redirects to their own roadmap' do
          get '/'
          expect(response).to render_template('roadmaps/show')
        end
      end

      context 'when trying to access someone else\'s roadmap' do
        let(:other_roadmap) { create(:roadmap, id: 5) }

        it 'redirects to their own roadmap' do
          get "/roadmaps/#{other_roadmap.id}"
          expect(response).to render_template('roadmaps/show')
        end
      end
    end

    context 'when user is logged out' do
      it 'shows the Roadmap homepage' do
        get '/'
        expect(response).to render_template('home')
      end
    end
  end
end
