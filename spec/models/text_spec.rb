# frozen_string_literal: true

# spec/models/text_spec.rb

require 'rails_helper'

RSpec.describe Text, type: :model do
  it 'is valid with valid attributes' do
    text = Text.new(content: 'Some content')
    expect(text).to be_valid
  end
end
