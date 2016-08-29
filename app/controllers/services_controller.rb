class ServicesController < ApplicationController
  def about_us
  
  end
# services CRUD
  def services
    if user_signed_in?
      @check = true
      @services = Service.all.order('id DESC').paginate(:page => params[:services_page], :per_page => 10)
    else
      redirect_to '/'
    end
  end
  def service_write_view
    if user_signed_in?
      @check = true
    else
      redirect_to '/'
    end
  end
  def service_write
    if user_signed_in?
      service = Service.new(title: params[:title],
                          content: params[:content],
                          public_check: params[:public_check],
                          user: current_user)
      service.save
      redirect_to "/service_info/#{service.id}"
    else
      redirect_to '/'
    end
  end
  def service_info
    @service = Service.find(params[:service_id])
    if @service.public_check && user_signed_in?
      @check = true
    elsif @service.user == current_user && current_user.kind == "M"
      @check = true
    else
      redirect_to '/'
    end
  end

  def service_delete
    service = Service.find(params[:service_id])
    if user_signed_in? && service.user == current_user
      service.destroy
    end
    redirect_to '/services'
  end
  def service_update_view
    if user_signed_in?
      @check = true
      @one_service = Service.find(params[:service_id])
    else
      redirect_to '/'
    end
  end
  def service_update
    service = Service.find(params[:service_id])
    if user_signed_in? && current_user == service.user
      service.title = params[:title]
      service.content = params[:content]
      service.public_check = params[:public_check]
      service.save
      redirect_to "/service_info/#{service.id}"
    else
      redirect_to '/'
    end
  end


  # post_reply CRUD
    def service_reply
      if user_signed_in?
        ServiceReply.create(content: params[:content],
                           service_id: params[:service_id],
                           user: current_user)
     end
      redirect_to "/service_info/#{params[:service_id]}"
    end

    def service_reply_delete
      r = ServiceReply.find(params[:re_id])
      if current_user == r.user
        r.destroy
      end
      redirect_to :back
    end
    def service_reply_update
      r = ServiceReply.find(params[:re_id])
      if current_user == r.user
        r.content = params[:content]
        r.save
      end
      redirect_to :back
    end



    def same_nickname
      nickname_check = User.where("nickname LIKE ?", "#{params[:nickname]}").empty?

      render :text => nickname_check.to_json
    end
end
