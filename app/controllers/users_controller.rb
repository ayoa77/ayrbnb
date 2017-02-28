class UsersController < Clearance::UsersController
  def new
    @user = User.new
     render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def show
    if current_user != nil
    @user = User.find_by(id: current_user.id)
    render template: "users/show"
    else
    redirect_to new_user_path
    end
  end

  def edit
  @user = User.find_by(id: current_user.id)
  end

  private
  def user_params
     params.require(:user).permit(:email, :username, :password) #, avatars: []
  end
end
