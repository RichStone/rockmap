class RoadmapsController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def show
    @roadmap = current_user.roadmap
  end

  def new
    redirect_to controller: 'roadmaps', action: 'show', id: current_user.roadmap.id if current_user.roadmap
  end

  def create
    @roadmap = current_user.create_roadmap(roadmap_params)

    if @roadmap.save
      redirect_to :action => 'show', success: 'Now you are even more awesome!'
    else
      flash[:alert] = 'Wrong details. You can do better ;)'
      render :new
    end
  end

  def edit
    @roadmap = Roadmap.find(params[:id])
  end

  def update
    @roadmap = current_user.roadmap

    if @roadmap.update(roadmap_params)
      redirect_to controller: 'roadmaps',
                  action: 'show',
                  id: current_user.roadmap.id,
                  success: 'Hopefully you stick to it now! ;)'
    else
      flash[:alert] = 'Wrong details. You can do better ;)'
      render :edit
    end
  end

  private

  def roadmap_params
    params.require(:roadmap).permit(
      :the_one_thing, :the_why_of_one_thing, :the_one_habit, :start_date
    )
  end
end