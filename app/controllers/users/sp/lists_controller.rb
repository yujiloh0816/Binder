class Users::Sp::ListsController < ApplicationController
  def index
    @lists = List.where(user_id: current_user.id)
  end

  def show
    # どっちの書き方が処理がはやいのか。
    # list = List.find(params[:id])
    # @inspections = list.inspections
    @inspections = Inspection.where(list_id: params[:id], status: nil)
  end
end
