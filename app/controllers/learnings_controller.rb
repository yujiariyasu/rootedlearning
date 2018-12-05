class LearningsController < ApplicationController
  def show
    @learning = Learning.find(params[:id])
    @user = @learning.user
    @review = Review.new
  end

  def create
    @learning = Learning.new(learning_params)
    if @learning.save
      flash[:info] = '学習を登録しました。'
    else
      flash[:danger] = '学習の登録に失敗しました。'
    end
    redirect_to params[:url]
  end

  private
  def learning_params
    params.require(:learning).permit(:title, :description, :image).merge(user_id: current_user.id)
  end
end