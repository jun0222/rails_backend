# frozen_string_literal: true

# メーラー機能の基底クラス
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
