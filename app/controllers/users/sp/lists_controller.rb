class Users::Sp::ListsController < ApplicationController

  def index
    @lists = List.where(user_id: current_user.id)
  end

  def show
    # ToDo inspectionのindexに移すべきか？
    @inspections = Inspection.only_backlog(params[:id])
  end

end
