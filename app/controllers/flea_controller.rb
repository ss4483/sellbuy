class FleaController < ApplicationController
  # Market CRUD
  def flea_enroll_view
    if user_signed_in? && current_user.kind == "M"
      @check = true
    end
  end
  def flea_enroll
    if user_signed_in? && current_user.kind == "M"
      one_flea = Flea.new(kind: params[:kind],title: params[:title],
                          term_start: params[:term_start],term_end: params[:term_end],
                          sel_term_start: params[:sel_term_start],sel_term_end: params[:sel_term_end],
                          address: params[:address],address2: params[:address2],
                          post: params[:post],supervision: params[:supervision],
                          sel_item: params[:sel_item],
                          condition: params[:condition],enter_link: params[:enter_link],
                          location: params[:location])

      uploader = SellbuyUploader.new   # 플리마켓 포스터
      uploader.store!(params[:pic])    # 파일 aws에 보내서 저장, aws에 파일 올림.

      one_flea.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
      one_flea.save

      flash[:notice] = "전송되었습니다"  # 레일즈 기본 문법임
    end
    redirect_to '/'
  end
  def flea_update_view
    if user_signed_in? && current_user.kind == "M"
      @check = true
      @one_flea = Flea.find(params[:flea_id])
    end
  end
  def flea_update
    if user_signed_in? && current_user.kind == "M"
      @one_flea = Flea.find(params[:flea_id])
      @one_flea.kind = params[:kind]
      @one_flea.title = params[:title]
      @one_flea.term_start = params[:term_start]
      @one_flea.term_end = params[:term_end]
      @one_flea.sel_term_start = params[:sel_term_start]
      @one_flea.sel_term_end = params[:sel_term_end]
      @one_flea.address = params[:address]
      @one_flea.address2 = params[:address2]
      @one_flea.post = params[:post]
      @one_flea.supervision = params[:supervision]
      @one_flea.sel_item = params[:sel_item]
      @one_flea.condition = params[:condition]
      @one_flea.enter_link = params[:enter_link]
      @one_flea.location = params[:location]
      if params[:pic].nil?
        @one_flea.image_url = @one_flea.image_url
      else
        uploader = SellbuyUploader.new   # post 이미지
        uploader.store!(params[:pic])    # 파일 aws에 보내서 저장, aws에 파일 올림.
        @one_flea.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
      end
      @one_flea.save
    end
    redirect_to '/'
  end
  def flea_delete
    if user_signed_in? && current_user.kind == "M"
      one_flea = Flea.find(params[:flea_id])
      one_flea.destroy
    end
    redirect_to '/'
  end
  def flea_info
    @check = true
    @one_flea = Flea.find(params[:flea_id])
  end

  def past_flea
    @fleas = Flea.all.order('updated_at DESC').where("term_end < ?", Time.zone.now.to_datetime ).paginate(:page => params[:past_fleas_page], :per_page => 12)
    @check = true
  end

  def pdf_upload
    if user_signed_in? && current_user.kind == "M"
      @one_flea = Flea.find(params[:flea_id])
      uploader = SellbuyUploader.new   # post 이미지
      uploader.store!(params[:pdf_url])    # 파일 aws에 보내서 저장, aws에 파일 올림.
      @one_flea.pdf_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
      @one_flea.save
    end
    redirect_to :back
  end
  def pdf_upload_delete
    if user_signed_in? && current_user.kind == "M"
      @one_flea = Flea.find(params[:flea_id])
      @one_flea.pdf_url = ""
      @one_flea.save
    end
    redirect_to :back
  end
end
