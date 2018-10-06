require 'test_helper'

class InfoMailerTest < ActionMailer::TestCase
  test "form_contact" do
    mail = InfoMailer.form_contact
    assert_equal "Form contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
