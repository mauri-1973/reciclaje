class DashboardController < ApplicationController
  

  def index
    @recyclers_count = Recycler.count
    @deliveries_total = Delivery.sum(:quantity)
    @deliveries_by_material = Delivery.joins(:material)
                                      .group('materials.name')
                                      .sum(:quantity)
  end
end
