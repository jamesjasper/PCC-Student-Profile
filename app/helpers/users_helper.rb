module UsersHelper
  
  def gravatar_for(email, options = { size: 80 })
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, class: "gravatar img-fluid")
  end

end
