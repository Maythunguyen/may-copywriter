require 'rails_helper'

RSpec.describe Note, type: :model do
  it 'is valid with valid attributes' do
    user = FactoryBot.create(:user)
    note = Note.new(content: 'Test Content', user: user)
    expect(note).to be_valid
  end

  it 'is not valid without content' do
    user = FactoryBot.create(:user)
    note = Note.new(user: user)
    expect(note).to_not be_valid
  end

  it 'is not valid without a user' do
    note = Note.new(content: 'Test Content')
    expect(note).to_not be_valid
  end
end
