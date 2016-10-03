class PostsController < ApplicationController
  def index
    @check = true
    @posts = Post.where(index_check: true).order('updated_at DESC').paginate(:page => params[:posts_page], :per_page => 9)
    @shorts = Flea.where(kind: "short")
    @longs = Flea.where(kind: "long")
    @main_fleas = Flea.all.order('updated_at DESC')[0..2]
  end

# post CRUD
  def post_write
    if user_signed_in? && current_user.kind == "seller"
      one_post = Post.new(kind: params[:kind],
                          content: params[:content],
                          rating: params[:rating],
                          user: current_user,
                          term_end: params[:term_end],
                          banner: params[:banner])# 마켓 id
        if params[:image_url] == ""
          uploader = SellbuyUploader.new   # post 이미지
          uploader.store!(params[:pic])    # 파일 aws에 보내서 저장, aws에 파일 올림.

          one_post.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
        else
          one_post.image_url = params[:image_url]
        end
      one_post.save
    end
    flash[:notice]="글이 작성 되었습니다."
      redirect_to '/'
  end
  def post_update
    one_post = Post.find(params[:post_id])
    if user_signed_in? && current_user == one_post.user

      one_post.content = params[:content]
      one_post.rating = params[:rating]
      if params[:image_url].nil?
        one_post.image_url = one_post.image_url
      else
        uploader = SellbuyUploader.new   # post 이미지
        uploader.store!(params[:image_url])    # 파일 aws에 보내서 저장, aws에 파일 올림.
        one_post.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
      end
      one_post.save
    end
    redirect_to :back
  end
  def post_delete
    one_post = Post.find(params[:post_id])
    if one_post.user == current_user
      one_post.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
# post_reply CRUD
  def post_reply
    if user_signed_in?
      r = PostReply.create(content: params[:content],
                         post_id: params[:post_id],
                         user: current_user)
   end
   re_time = r.created_at.in_time_zone("Asia/Seoul").strftime("%m월%d일 %H:%M")
   render :text => re_time.to_json
  end

  def reply_delete
    r = PostReply.find(params[:re_id])
    if current_user == r.user
      r.destroy
    end
    redirect_to '/'
  end
  def reply_update
    r = PostReply.find(params[:re_id])
    if current_user == r.user
      r.content = params[:content]
      r.save
    end
    redirect_to '/'
  end
# post 좋아요
  def post_like
    if user_signed_in?
      one_post = Post.find(params[:post_id])
      check = true
      current_user.post_likes.all.each do |l|
        if l.post_id == one_post.id
          current_user.post_likes.all.delete(l)
          check = false
        end
      end
      if check
        PostLike.create(post_id: params[:post_id], user_id: current_user.id)
      end
    end
    redirect_to "/"
  end

# 검색
  def searches
    @check = true
    @search = params[:search]
    seller_user = User.where(kind: "seller")
    @user_searches = seller_user.where("email LIKE ? OR nickname LIKE ? OR category LIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%").order('updated_at DESC').paginate(:page => params[:user_searches_page], :per_page => 12)
    @post_searches = Post.where("content LIKE ?", "%#{@search}%").order('updated_at DESC').paginate(:page => params[:post_searches_page], :per_page => 12)
    @flea_searches = Flea.where("sel_item LIKE ? OR title LIKE ? OR post LIKE ? OR location LIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%").order('updated_at DESC').paginate(:page => params[:flea_searches_page], :per_page => 12)
  end



  # ajax
  def last_re_id
    if PostReply.last.nil?
      last_re_id= 0
    else
      last_re_id = PostReply.last.id
    end

    render :text => last_re_id.to_json
  end
end
