module UserPageHelper
  def facebook_url(url)
    unless url.blank?
      link_to(image_tag("#{image_path('facebook.png')}", alt: "facebook", class: "profile" ), "#{url}", target: "_blank")
    end
  end
  def instar_url(url)
    unless url.blank?
      link_to(image_tag("#{image_path('instar.png')}", alt: "facebook", class: "profile" ), "#{url}", target: "_blank")
    end
  end
  def twitter_url(url)
    unless url.blank?
      link_to(image_tag("#{image_path('twitter.png')}", alt: "facebook", class: "profile" ), "#{url}", target: "_blank")
    end
  end
  def blog_url(url)
    unless url.blank?
      link_to(image_tag("#{image_path('blog.png')}", alt: "facebook", class: "profile" ), "#{url}", target: "_blank")
    end
  end
end
