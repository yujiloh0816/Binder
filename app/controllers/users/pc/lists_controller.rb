class Users::Pc::ListsController < Users::BaseController
  def index
    @list = List.new
  end

  def show
    list = List.find(params[:id])
    @inspections = list.inspections

    # ToDo
    # リファクタリングする
    # @inspections.select do |inspection|
    #   inspection.status == 'good'
    #   # ToDo
    #   # parameterでステータスを受け取れるようにする。
    #   # if params[:status] == 0 || 1 || 2
    #   #   inspection.status == params[:status]
    #   # else
    #   #   render 'show'
    #   # end
    # end
    goods = @inspections.pluck(:company_id)
    # goods = good_inspections.pluck(:company_id)

    companies = Company.where(id: goods)

    respond_to do |format|
      format.html
      format.csv { send_data companies.to_csv }
    end
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
