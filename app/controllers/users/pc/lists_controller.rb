class Users::Pc::ListsController < Users::BaseController
  before_action :set_lists
  before_action :authenticate_user!, only: [:show, :create]


  def index
    @list = List.new
  end

  def show
      list = List.find(params[:id])
      @inspections = list.inspections

    if current_user == list.user
      respond_to do |format|
        format.html
        format.csv {send_data comapnies_with_status.to_csv}
      end
    else
      redirect_to users_pc_lists_path
    end
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      Company.import(params[:file], @list.id )
      redirect_to users_pc_list_path(@list), notice: "Company imported"
    else
      render :index
    end
  end

  private

    def list_params
      params.require(:list).permit(:title)
    end

    def set_lists
      @lists = current_user.try(:lists)
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
