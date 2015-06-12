class UserDecorator < Draper::Decorator
  delegate_all

  def fullname
    "#{object.firstname} #{object.lastname}"
  end

  def mail
    h.mail_to object.email
  end

  def last_login
    if object.last_sign_in_at
      "Last seen #{h.time_ago_in_words(object.last_sign_in_at)} ago."
    else
      "User hasn't been active recently"
    end
  end

end
