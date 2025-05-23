class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { head :ok }
      end
    else
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_comment",
            partial: "comments/form",
            locals: { project: @project, comment: @comment }
          )
        }
        format.html { render 'projects/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end