class HelloController < ApplicationController
  
  def index
    @food = params[:food]
    @drink = params[:drink]
  end
  
end