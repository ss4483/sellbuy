module ServicesHelper
  def service_title(service)
    if service.public_check || current_user == service.user || current_user.kind == "M"
      link_to(service.title , "/service_info/#{service.id}", method: :get,class: "left enjoy-css", style: "height:30px;")
    else
      content_tag(:span, "비공개 질문입니다.",class: "left", style: "height:30px;")
    end
  end

end
