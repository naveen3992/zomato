require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "review_created" do
    mail = Notifier.review_created
    assert_equal "Review created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
