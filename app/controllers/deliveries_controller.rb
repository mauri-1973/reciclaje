class DeliveriesController < ApplicationController
    before_action :set_recycler, only: [:new, :create, :index]
    
    def index
        #@deliveries = Delivery.includes(:material, :recycler).all
        @deliveries = Delivery.page(params[:page]).per(10)
    end
    def new
      @delivery = @recycler.deliveries.build
    end
  
    def create
      @delivery = @recycler.deliveries.build(delivery_params)
      if @delivery.save
        redirect_to recycler_deliveries_path(@recycler), notice: 'Entrega registrada exitosamente.'
      else
        render :new
      end
    end
  
    def index
      @deliveries = @recycler.deliveries.includes(:material)
    end
  
    private
    
    def set_recycler
      @recycler = Recycler.find(params[:recycler_id])
    end
    
    def delivery_params
      params.require(:delivery).permit(:material_id, :quantity, :delivery_date)
    end

  end
