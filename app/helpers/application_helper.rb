module ApplicationHelper
  def gravatar_for(user, option = { size: 80 })
    user_email = user.email.downcase
    hash = Digest::MD5.hexdigest(user_email)
    size = option[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end
end
