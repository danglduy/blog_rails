# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@sqrsqr.com'
  layout 'mailer'
end
