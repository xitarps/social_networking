class Admin::AdminsController < AdminController
  before_action :set_admin, only: %i[edit update destroy]
  def index
    @admins = Admin.order(id: :desc)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    return redirect_to admin_admins_path if @admin.save

    render :new
  end

  def edit
  end

  def update

    return redirect_to admin_admins_path if @admin.update(admin_params)

    render :edit
  end

  def destroy

    return redirect_to admin_admins_path if @admin && @admin.destroy

    @admins = Admin.order(id: :desc)
    render :index, alert: 'Oops error'
    
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find_by(id: params[:id])
  end
end
