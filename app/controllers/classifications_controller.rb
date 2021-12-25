class ClassificationsController < ApplicationController
  def index 
    @user = current_user
    @items = @user.items
    @wants = @user.wants
  end

    # likes = Like.where(user_id: @user.id).pluck(:event_id)  # ログイン中のユーザーのお気に入りのevent_idカラムを取得
    # @like_posts = Event.find(likes)
end
