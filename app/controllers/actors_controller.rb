class ActorsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def index
    if current_user.role == 'admin'
      @actors = Actor.all
    else
      render text: "Sorry"
    end
  end
  
  def show
    @actor = Actor.find_by(id: params[:id])  
  end

  def new
    @actor = Actor.new
  end
  
  def create
    @actor = Actor.new
    @actor.name = params[:actor][:name]
    upload_photo
    @actor.save
    redirect_to actors_url
  end
  
  def edit
    @actor = Actor.find_by(id: params[:id])
  end
  
  def update
    @actor = Actor.find_by(id: params[:id])
    @actor.name = params[:actor][:name]
    upload_photo
    @actor.save
    redirect_to actors_url
  end
  
  def destroy
    @actor = Actor.find_by(id: params[:id])
    @actor.destroy
    redirect_to actors_url
  end

  def upload_photo
    # read the uploaded file
    file = params[:actor][:photo]
    if file.present?
      @actor.image = Base64.encode64(params[:actor][:photo].read)
    end
  end

end