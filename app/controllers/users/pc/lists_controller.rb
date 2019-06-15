class Users::Pc::ListsController < Users::BaseController
  def index
  end

  def show
  end

  def import
    Company.import(params[:file])
    redirect_to users_pc_lists_path, notice: "Company imported"
  end

end
