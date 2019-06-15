class Users::Pc::ListsController < Users::BaseController
  def index
    @list = List.new
  end

  def show
  end

  def create
    @list = List.new(list_params)
    # ToDo: 1をcurrent_user.idに変更
    @list.user_id = 1
    if @list.save
      Company.import(params[:file], @list.id )
      redirect_to users_pc_lists_path, notice: "Company imported"
    else
      render :index
    end
  end

  private

    def list_params
      params.require(:list).permit(:title)
    end

end
