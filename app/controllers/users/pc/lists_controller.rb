class Users::Pc::ListsController < Users::BaseController
  def index
    @list = List.new
  end

  def show
    list = List.find(params[:id])
    @inspections = list.inspections

    respond_to do |format|
      format.html
      format.csv {send_data comapnies_with_status.to_csv}
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

    # statusによってダウンロード情報を切り分ける
    def comapnies_with_status
      companies_with_status = @inspections.select do |inspection|
        if params[:status].in?(["good","bad"])
          inspection.status == params[:status]
        elsif params[:status] == "all"
          inspection.present?
        else
          render 'show'
        end
      end

      Company.where(id: companies_with_status.pluck(:company_id))
    end

end
