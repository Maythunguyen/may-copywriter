require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  render_views

  let(:user) { create(:user) }
  let(:note) { create(:note, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: note.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new Note' do
      expect {
        post :create, params: { note: attributes_for(:note) }
      }.to change(Note, :count).by(1)
    end
  end
end
