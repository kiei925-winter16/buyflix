class ActorsController < ApplicationController

  def index
    @actors = Actor.all
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