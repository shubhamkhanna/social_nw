class HomeController < ApplicationController
  def index
    @post = current_user.posts.build
      if request.post?
      @post=Post.create(params[:post])
     
  end
    users = []
    users << current_user.id
    users << current_user.friends.map(&:friend_id)
    users.flatten!
    @posts=Post.user_friends_post(users)

  end
  def comment
    @post=Post.find(params[:comment][:post_id])
    @comment=@post.comments.build
    if request.post?
      @comment=Comment.create(params[:comment])
    end

    respond_to  do |format|
      format.html
      format.js
    end


  end
  
 def like
  
   @like=Like.create(:like_id=>params[:like_id],:like_type=>params[:like_type],:user_id=>current_user.id  )
   
 respond_to  do |format|
      format.html
      format.js
    end
 end
def unlike
  @unlike=Like.find(params[:id])
 @likable=@unlike.like
  @likable_id = @unlike.like_id
  @likable_type = @unlike.like_type
  @unlike.destroy

  respond_to  do |format|
      format.html
      format.js
    end
end
def like_people  
 @like_id=params[:like_id]
  @like_people=User.select("firstname").where(['likes.like_id = ? and likes.like_type = ?',params[:like_id],params[:like_type]]).joins(:likes)
end
respond_to  do |format|
      format.html
      format.js
    end
end
