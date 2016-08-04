class UserPageController < ApplicationController
  #  Seller_page
  def user_page
    @posts = Post.all
    @one_user = User.find(params[:user_id])
    if @one_user.kind == 'seller'
      @seller_check = true
      if user_signed_in?
        @check_favorite = false
        current_user.favorites.each do |f|
          if f == @one_user
            @check_favorite  = true
          else
            @check_favorite  = false
          end
        end
      end
    end
  end
  # 즐겨찾기
  def user_favorite
    one_user = User.find(params[:user_id])
    check = true
    current_user.favorites.each do |f|
      if f == one_user
        current_user.favorites.delete(one_user)
        check = false
      end
    end
    if check
      current_user.favorites << one_user
    end
      redirect_to "/user_page/#{params[:user_id]}"
  end

  # 후기
  def epilogue
    one_epilogue = Post.new(kind: params[:kind],
                        index_check: false,
                        content: params[:content],
                        other_user: params[:user_id],
                        user: current_user,
                        rating: params[:rating])

      uploader = SellbuyUploader.new   # post 이미지
      uploader.store!(params[:pic])    # 파일 aws에 보내서 저장, aws에 파일 올림.

      one_epilogue.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)


    one_epilogue.save
    redirect_to "/user_page/#{params[:user_id]}"
  end
  def epilogue_delete
    one_epilogue = Post.find(params[:epilogue_id])
    if one_epilogue.user == current_user
      one_epilogue.destroy
    end

    redirect_to :back
  end

  def epilogue_update
    one_epilogue = Post.find(params[:epilogue_id])
    one_epilogue.content = params[:content]
    one_epilogue.rating = params[:rating]
    if params[:image_url].nil?
      one_epilogue.image_url = one_epilogue.image_url
    else
      uploader = SellbuyUploader.new   # post 이미지
      uploader.store!(params[:image_url])    # 파일 aws에 보내서 저장, aws에 파일 올림.
      one_epilogue.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
    end
    one_epilogue.save

    redirect_to :back
  end

  def epilogue_check
    one_epilogue = Post.find(params[:epilogue_id])
    if one_epilogue.index_check
      one_epilogue.index_check = false
    else
      one_epilogue.index_check = true
    end
    one_epilogue.save
    redirect_to :back
  end
end
