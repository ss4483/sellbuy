module FleaHelper
  def short_title(m)
    if m[6].nil?
      m[0..5]
    else
      m[0..5]
    end
  end

  def flea_seller_nil(seller_nick)
    unless User.where("kind LIKE ? AND nickname LIKE ?", "%seller%", "%#{seller_nick}%").empty?
      link_to(User.where("kind LIKE ? AND nickname LIKE ?", "%seller%", "%#{seller_nick}%").take.nickname , "/user_page/#{User.where("kind LIKE ? AND nickname LIKE ?", "%seller%", "%#{seller_nick}%").take.id}", method: :get, class:"seller_nickname", style:'font-size:15px')
    else
      content_tag(:span, "#{seller_nick}", class:"nickname", style:'font-size:15px')
    end
  end
end
