class FleaController < ApplicationController
  # Market CRUD
  def flea_enroll_view
    @check = true
  end
  def flea_enroll
    one_flea = Flea.new(kind: params[:kind],title: params[:title],
                        term_start: params[:term_start],term_end: params[:term_end],
                        sel_term_start: params[:sel_term_start],sel_term_end: params[:sel_term_end],
                        address: params[:address],post: params[:post],supervision: params[:supervision],
                        condition: params[:condition],enter_link: params[:enter_link])

    uploader = SellbuyUploader.new   # 플리마켓 포스터
    uploader.store!(params[:pic])    # 파일 aws에 보내서 저장, aws에 파일 올림.

    one_flea.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
    one_flea.save

    flash[:notice] = "전송되었습니다"  # 레일즈 기본 문법임
    redirect_to '/'
  end
  def flea_update_view
    @check = true
    @one_flea = Flea.find(params[:flea_id])
  end
  def flea_update
    @one_flea = Flea.find(params[:flea_id])
    @one_flea.kind = params[:kind]
    @one_flea.title = params[:title]
    @one_flea.term_start = params[:term_start]
    @one_flea.term_end = params[:term_end]
    @one_flea.sel_term_start = params[:sel_term_start]
    @one_flea.sel_term_end = params[:sel_term_end]
    @one_flea.address = params[:address]
    @one_flea.post = params[:post]
    @one_flea.supervision = params[:supervision]
    @one_flea.condition = params[:condition]
    @one_flea.enter_link = params[:enter_link]
    @one_flea.save

    redirect_to '/'
  end
  def flea_delete
    one_flea = Flea.find(params[:flea_id])
    one_flea.destroy

    redirect_to '/'
  end
  def flea_info
    @check = true
    @one_flea = Flea.find(params[:flea_id])
  end

end
