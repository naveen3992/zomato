class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.review_created.subject
  #
  def review_created(restaurant)
    @greeting = "Hi"
    @rowner =restaurant.user
    @restaurant =restaurant


    mail to: restaurant.user.email,:subject =>"Review created on your restaurant "
  end 
end
