class BrandController < ApplicationController
  def show
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @brand = Brand.find(params[:id])
  end
end
