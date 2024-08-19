# frozen_string_literal: true

# ダミーデータ処理のコントローラ
class DummyDataController < ApplicationController
  require 'jwt'
  require 'base64'

  def index
    @name = Faker::JapaneseMedia::OnePiece.character # 日本人名を使う
    @dob = Faker::Date.birthday(min_age: 18, max_age: 65)
    @address = Faker::Address.full_address
    @uuid = SecureRandom.uuid
    @phone = Faker::PhoneNumber.cell_phone_in_e164
    @postal_code = Faker::Address.zip_code
    @email = Faker::Internet.email(domain: 'example.com')

    # JWTのサンプルデータ
    payload = { data: 'test' }
    @jwt = JWT.encode(payload, 'secret', 'HS256')

    # Base64エンコードされた文字列
    @base64 = Base64.encode64('Sample data for encoding')
  end
end
