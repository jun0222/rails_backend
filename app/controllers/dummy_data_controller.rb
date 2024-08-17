# frozen_string_literal: true

# ダミーデータ処理のコントローラ
class DummyDataController < ApplicationController
  def index
    @name = Faker::Name.name
    @dob = Faker::Date.birthday(min_age: 18, max_age: 65)
    @address = Faker::Address.full_address
    @uuid = SecureRandom.uuid
    @phone = Faker::PhoneNumber.phone_number
    @postal_code = Faker::Address.zip_code
    @email = Faker::Internet.email(domain: 'example.com')
  end
end
