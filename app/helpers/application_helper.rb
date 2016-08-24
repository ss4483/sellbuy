module ApplicationHelper
  def user_nickname_ep(user_id)
    if User.find(user_id).kind == "seller"
      content_tag(:span, "#{User.find(user_id).nickname}", class:"seller_nickname", style: "cursor: pointer; font-size:12px;")
    else
      content_tag(:span, "#{User.find(user_id).nickname}", class:"nickname", style: "cursor: pointer; font-size:12px;")
    end
  end
  def user_nickname_index(user_id)
    if User.find(user_id).kind == "seller"
      content_tag(:span, "#{User.find(user_id).nickname}", class:"seller_nickname", style: "cursor: pointer")
    else
      content_tag(:span, "#{User.find(user_id).nickname}", class:"nickname", style: "cursor: pointer")
    end
  end

  def user_nickname_page(user_id)
    if User.find(user_id).kind == "seller"
        link_to(User.find(user_id).nickname , "/user_page/#{user_id}", method: :get, class:"seller_nickname")
    else
      content_tag(:span, "#{User.find(user_id).nickname}", class:"nickname")
    end
  end
  def user_profile(user_id)
    if User.find(user_id).profile.blank?
      content_tag :img, nil, src: "#{image_path('profile.jpg')}", class: "profile", style: "vertical-align:bottom; margin:8px;"
    else
      content_tag :img, nil, src: "#{User.find(user_id).profile}", class: "profile", style: "vertical-align:bottom; margin:8px;"
    end
  end

  def user_page_profile(user_id)
    if User.find(user_id).profile.blank?
      content_tag :img, nil, src: "#{image_path('profile.jpg')}", class: "user_page"
    else
      content_tag :img, nil, src: "#{User.find(user_id).profile}", class: "user_page"
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

  def like_btn(post)
    if user_signed_in? && post.post_likes.where(post_id: post.id, user_id: current_user.id).blank?
      button_tag(class: "like_submit enjoy-css", value: "#{post.id}", style: "width: 25px; height: 25px;") do
        image_tag("#{image_path('unlike.png')}", class: "unlike_img", style: "vertical-align:bottom; height: 25px;")
      end
    elsif user_signed_in?
      button_tag(class: "like_submit enjoy-css", value: "#{post.id}", style: "width: 25px; height: 25px;") do
        image_tag("#{image_path('like.png')}", class: "like_img", style: "vertical-align:bottom; height: 25px;")
      end
    else
      image_tag("#{image_path('like.png')}", class: "like_img", style: "vertical-align:bottom; height: 25px;")
    end

  end
# Q&A
  def q_nickname_page(user_id)
    if User.find(user_id).kind == "seller"
        link_to(User.find(user_id).nickname , "/user_page/#{user_id}", method: :get, class:"q_seller_nickname")
    else
      content_tag(:span, "#{User.find(user_id).nickname}", class:"q_nickname")
    end
  end


  def market_link(url)
    unless Flea.where("image_url LIKE ?", "%#{url}%").empty?
      p "/flea_info/#{Flea.where("image_url LIKE ?", "%#{url}%").take.id}"
    end
  end
end
