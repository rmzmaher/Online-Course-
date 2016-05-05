class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit,:destroy,:show]
  before_filter :block_index, only: :index
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    respond_to do |format|
      format.html
    end
  end

  # GET /users/1/edit
  def edit
    respond_to do |format|
      format.html
  end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

      if @user.save
      	session[:user_id] = @user.id
        redirect_to root_url, notice: 'User was successfully created.'
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
   end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def require_permission
  if current_user.id != @user.id
    redirect_to root_path
  end
end

def block_index
  if current_user != @user 
    redirect_to root_path
  else
    redirect_to root_path
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :date_of_birth, :gender, :prof_pic, :password, :password_confirmation)
    end

end

