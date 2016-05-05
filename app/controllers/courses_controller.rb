class CoursesController < InheritedResources::Base
before_filter :require_permission, only: [:edit,:destroy]
before_filter :login, only: [:new]
def index
		@courses=Course.where(user_id: current_user.id)
  end

def login
	if current_user == nil
	redirect_to root_path
end

end
def require_permission
  if current_user != Course.find(params[:id]).user
    redirect_to root_path
  end
end
  private

    def course_params
      params.require(:course).permit(:title, :user_id)
    end

end

