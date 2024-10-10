class CommentsController < ApplicationController
  before_action :require_login

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article), notice: 'Комментарий добавлен.'
    else
      redirect_to article_path(@article), alert: 'Ошибка при добавлении комментария.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: 'Вы должны войти для добавления комментария.'
    end
  end
end
