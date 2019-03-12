class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
#START:index
  def index
#START_HIGHLIGHT
    @users = User.order(:name)
#END_HIGHLIGHT
  end
#END:index

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
#START:create
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
#START_HIGHLIGHT
        format.html { redirect_to users_url,
          notice: "User #{@user.name} was successfully created." }
#END_HIGHLIGHT
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors,
          status: :unprocessable_entity }
      end
    end
  end
#END:create

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
#START:update
  def update
    respond_to do |format|
      if @user.update(user_params)
#START_HIGHLIGHT
        format.html { redirect_to users_url,
          notice: "User #{@user.name} was successfully updated." }
#END_HIGHLIGHT
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors,
          status: :unprocessable_entity }
      end
    end
  end
#END:update

  # DELETE /users/1
  # DELETE /users/1.json
#START:delete_user
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url,
        notice: '"User #{@user.name} deleted"' }
      format.json { head :no_content }
    end
  end

  #START_HIGHLIGHT
  rescue_from 'User::Error' do |exception|
    redirect_to users_url, notice: exception.message
  end
  #END_HIGHLIGHT
#END:delete_user

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
