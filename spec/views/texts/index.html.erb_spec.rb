# frozen_string_literal: true

# spec/views/texts/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'texts/index', type: :view do
  it 'displays all the texts' do
    assign(:texts, [
             Text.create!(content: 'Text 1'),
             Text.create!(content: 'Text 2')
           ])

    render

    expect(rendered).to match(/Text 1/)
    expect(rendered).to match(/Text 2/)
  end
end
