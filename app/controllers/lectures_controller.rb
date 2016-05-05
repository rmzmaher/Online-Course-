class LecturesController < InheritedResources::Base
before_filter :require_permission, only: [:edit,:destroy]

def index
    @lectures = Lecture.where(:course_id => params[:format])
    #@lectures=params;
	@courses=Course.where(user_id: current_user.id)
end

def new
    @lecture = Lecture.new
	@course=Course.where(user_id: current_user.id)
    respond_to do |format|
      format.html
    end
end

# GET /lectures/1/edit
def edit
    @lecture = Lecture.find(params[:id])
  	@course=Course.where(user_id: current_user.id)
    respond_to do |format|
      format.html
  end
  end


def upvote
	    @lecture = Lecture.find(params[:id])
	    @lecture.liked_by current_user
	    redirect_to @lecture
end

def downvote
	    @lecture = Lecture.find(params[:id])
	    @lecture.downvote_from current_user
	    redirect_to @lecture
end

def download
    my_file = Lecture.find(params[:file]).file.path
    send_file my_file
end

def require_permission
  if current_user != Lecture.find(params[:id]).course.user
    redirect_to root_path
  end
end

  private

    def lecture_params
      params.require(:lecture).permit(:content, :file, :course_id)
    end


end

