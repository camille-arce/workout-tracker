class ZetsController < ApplicationController
  def index
    matching_zets = Zet.all

    @list_of_zets = matching_zets.order({ :created_at => :desc })

    render({ :template => "zets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_zets = Zet.where({ :id => the_id })

    @the_zet = matching_zets.at(0)

    render({ :template => "zets/show.html.erb" })
  end

  def create
    the_zet = Zet.new
    the_zet.reps = params.fetch("query_reps")
    the_zet.weight = params.fetch("query_weight")
    the_zet.exercise_id = params.fetch("query_exercise_id")

    if the_zet.valid?
      the_zet.save
      redirect_to("/zets", { :notice => "Zet created successfully." })
    else
      redirect_to("/zets", { :alert => the_zet.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_zet = Zet.where({ :id => the_id }).at(0)

    the_zet.reps = params.fetch("query_reps")
    the_zet.weight = params.fetch("query_weight")
    the_zet.exercise_id = params.fetch("query_exercise_id")

    if the_zet.valid?
      the_zet.save
      redirect_to("/zets/#{the_zet.id}", { :notice => "Zet updated successfully."} )
    else
      redirect_to("/zets/#{the_zet.id}", { :alert => the_zet.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_zet = Zet.where({ :id => the_id }).at(0)

    the_zet.destroy

    redirect_to("/zets", { :notice => "Zet deleted successfully."} )
  end
end
