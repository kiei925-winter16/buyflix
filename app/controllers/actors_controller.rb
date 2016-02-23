class ActorsController < ApplicationController

  def index
    if current_user.role == 'admin'
      @actors = Actor.all
    else
      render text: "Sorry"
    end
  end
  
  def show
    
  end

  def new
    @actor = Actor.new
  end
  
  def create
    @actor = Actor.new
    @actor.name = params[:actor][:name]
    @actor.save
    redirect_to actors_url
  end
  
  def edit
    @actor = Actor.find_by(id: params[:id])
  end
  
  def update
    @actor = Actor.find_by(id: params[:id])
    @actor.name = params[:actor][:name]
    @actor.save
    redirect_to actors_url
  end
  
  def destroy
    @actor = Actor.find_by(id: params[:id])
    @actor.destroy
    redirect_to actors_url
  end

end