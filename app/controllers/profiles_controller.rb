class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @profiles = Profile.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def show
  end

  def new
    @profile = current_user.profiles.build
  end

  def edit
  end

  def create
    @profile = current_user.profiles.build(profile_params)

      if @profile.save
        redirect_to @profile, notice: 'Profile was successfully created.' 
      else
        render action: 'new'
      end
  end

  def update
      if @profile.update(profile_params)
        redirect_to @profile, notice: 'Profile was successfully updated.' 
      else
        format.html render action: 'edit' 
      end
  end

  def destroy
    @profile.destroy
      redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def correct_user
        @profile = current_user.profiles.find_by(id: params[:id])
        redirect_to profiles_path, notice: "Not authorized to edit this profile" if @profile.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:about, :image)
    end
end
