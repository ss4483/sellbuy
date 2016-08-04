class PostController < ApplicationController
  def index
    @check = true
    @posts = Post.all.reverse
    @shorts = Flea.where(kind: "short")
    @longs = Flea.where(kind: "long")
  end
  def searches
    @check = true
    @search = params[:search]
    seller_user = User.where(kind: "seller")
    @user_searches = seller_user.where("email LIKE ? OR nickname LIKE ?", "%#{@search}%", "%#{@search}%")
    @post_searches = Post.where("content LIKE ?", "%#{@search}%")
    @flea_searches = Flea.where("sel_item LIKE ? OR title LIKE ? OR post LIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%")
  end
# post CRUD
  def post_write
    one_post = Post.new(kind: params[:kind],
                        content: params[:content],
                        rating: params[:rating],
                        user: current_user)
      if params[:img_url] == ""
        uploader = SellbuyUploader.new   # post 이미지
        uploader.store!(params[:pic])    # 파일 aws에 보내서 저장, aws에 파일 올림.

        one_post.image_url = uploader.url   # 파일 db에 저장(OOO.url만 찍어주면 그 파일의 url 주소가 뜸.)
      else
        one_post.image_url = params[:img_url]
      end
    one_post.save

    redirect_to '/'
  end
  def post_update
    one_post = Post.find(params[:post_id])
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
    PostReply.create(content: params[:content],
                       post_id: params[:post_id],
                       user: current_user)
    redirect_to :back
  end

  def reply_delete
    r = PostReply.find(params[:re_id])
    r.destroy
    redirect_to :back
  end
  def reply_update
    r = PostReply.find(params[:re_id])
    r.content = params[:content]
    r.save

    redirect_to '/'
  end
# post 좋아요
  def post_like
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
    redirect_to "/"
  end
end
