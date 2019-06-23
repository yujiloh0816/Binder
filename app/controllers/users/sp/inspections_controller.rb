class Users::Sp::InspectionsController < ApplicationController

  def create
    reaction = Inspection.find_by(id: params[:inspection_id])
    reaction.update_attributes(status: params[:reaction])
  end

end
