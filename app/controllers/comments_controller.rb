class CommentsController < InheritedResources::Base
 
	#before_filter :authenticate_user!

def create
	@lecture = Lecture.find(params[:lecture_id])
	#@comment = @lecture.comments.create(params[:comment])
	@comment = Comment.new(comment_params)
	respond_to do |format|
			if @comment.save
				format.html { redirect_to @lecture, notice: 'Comment was successfully created.' }
				format.json { render json: @comment, status: :created, location: @comment }
			else
				format.html { render action: "new" }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end
# PUT /comments/1
# PUT /comments/1.json
 #private

    def comment_params
      params.require(:comment).permit(:body, :lecture_id)
    end
    def lecture_params
      params.require(:lecture).permit(:content, :file, :course_id)
    end

end