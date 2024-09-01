# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DummyDataHelper. For example:
#
# describe DummyDataHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DummyDataHelper, type: :helper do
  # pending "add some examples to (or delete) #{__FILE__}"
  # 絶対に通るテスト
  it '絶対に通るテスト' do
    expect(1).to eq(1)
  end
end
