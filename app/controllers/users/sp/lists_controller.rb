class Users::Sp::ListsController < ApplicationController

  def index
    @lists = List.where(user_id: current_user.id)
  end

  def show
    # TODO: inspectionのindexに移すべきか？
    @inspections = Inspection.only_backlog(params[:id])
    redirect_to users_sp_lists_path if @inspections.blank?
    # TODO: flash を追加する
  end

end
