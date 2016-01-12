class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :manufacturers
  before_action :set_breadcrumbs

  private

  def manufacturers
    @manufacturers = Manufacturer.all
  end

  def set_breadcrumbs
    @breadcrumbs = []
    breadcrumb = Struct.new(:name, :path)
    if controller_name != "main"
      @breadcrumbs << breadcrumb.new("Главная", root_path)
    end
    if controller_name == "manufacturers"
      @manufacturer = Manufacturer.find(params[:id])
      @breadcrumbs << breadcrumb.new(@manufacturer.name)
    end
    if controller_name == "brand"
      @manufacturer = Manufacturer.find(params[:manufacturer_id])
      @breadcrumbs << breadcrumb.new(@manufacturer.name, manufacturer_path(@manufacturer))
      @brand = Brand.find(params[:id])
      @breadcrumbs << breadcrumb.new(@brand.name)
    end
  end

end
