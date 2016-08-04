module ApplicationHelper
  def user_nickname_page(user_id)
    if User.find(user_id).kind == "seller"
        link_to(User.find(user_id).nickname , "/user_page/#{user_id}", method: :get)
    else
        User.find(user_id).nickname
    end
  end
  def user_profile(user_id)
    if User.find(user_id).profile.blank?
      content_tag :img, nil, src: "#{image_path('profile.jpg')}", class: "profile"
    else
      content_tag :img, nil, src: "#{User.find(user_id).profile}", class: "profile"
    end
  end
  def user_find(user_id)
    User.find(user_id)
  end
  def fleas
    Flea.all.reverse
  end

  def search(search)
    if search.nil?
    else
      search
    end
  end
end
