class MaterialsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_operador_or_admin!
    before_action :set_material, only: [:edit, :update, :destroy]
    before_action :set_recycler
    def index
        Material.includes(:recycler).all
    end
  
    def new
      @material = @recycler.materials.build
    end
  
    def create
      @material = @recycler.materials.build(material_params)
      if @material.save
        redirect_to recycler_path(@recycler), notice: 'Material creado exitosamente.'
      else
        render :new
      end
    end
  
    def show
        @recycler = Recycler.find(params[:id])
        @materials = @recycler.materials.page(params[:page]).per(10)
    end

    def edit
    end
  
    def update
      if @material.update(material_params)
        redirect_to recycler_path(@recycler), notice: 'Material actualizado exitosamente.'
      else
        render :edit
      end
    end
  
    def destroy
      @material.destroy
      redirect_to recycler_path(@recycler), notice: 'Material eliminado exitosamente.'
    end
  
    private
  
    def set_material
      @material = Material.find(params[:id])
    end
  
    def set_recycler
      @recycler = Recycler.find(params[:recycler_id])
    end
  
    def material_params
      params.require(:material).permit(:name, :description)
    end
    def authorize_operador_or_admin!
        redirect_to root_path, alert: 'No tienes permiso para acceder a esta página.' unless current_user&.operador?
    end
  end
