class UsersController < ApplicationController
    
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update, :show]
    
  def show
        @a_classes = @user.a_classes.paginate(page: params[:page])
  end
    
  def new
      @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Life Tracker!"
      redirect_to @user
    else
      render 'new'
    end
  end
    
    def edit
    end
    
   def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
    
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    #before filters
    
    def signed_in_user
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(signin_path) unless current_user?(@user)
    end
end