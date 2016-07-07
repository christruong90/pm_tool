class DiscussionsController < ApplicationController
  def create
    @project = Project.find params[:project_id]
    discussion_params = params.require(:discussion).permit(:body, :title)
    @discussion   = Discussion.new discussion_params

    if @discussion.save
      redirect_to project_path(@project), notice: "Discussion created!"
    else
      render "/projects/show"
    end
  end
end
