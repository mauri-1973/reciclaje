class RecyclersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_operador_or_admin!
    before_action :set_recycler, only: [ :edit, :update, :destroy]
    def index
        @recyclers = Recycler.page(params[:page]).per(10) # Paginación de 10 elementos por página
    end
  
    def new
      @recycler = Recycler.new
      @materials = Material.all
    end
  
    def create
        @recycler = Recycler.new(recycler_params)
    
        if @recycler.save
          # Comprobar si se han pasado los IDs de materiales
          if params[:recycler][:material_ids]
            params[:recycler][:material_ids].each do |material_id|
              # Asociar materiales al reciclador
              material = Material.find(material_id)
              @recycler.materials << material
            end
          end
          
          redirect_to recyclers_path, notice: 'Reciclador creado exitosamente.'
        else
          flash.now[:alert] = 'Error al crear el reciclador. Verifica los campos obligatorios.'
          render :new
        end
      rescue ActiveRecord::RecordNotUnique
        flash.now[:alert] = 'El correo electrónico ya está registrado.'
        render :new
    end

    
    def edit
       #@recycler 
    end
    def show
        redirect_to recyclers_path, alert: 'Acción no disponible.'
    end
  
    # Método para procesar la actualización
    def update
      if @recycler.update(recycler_params)
        redirect_to recyclers_path, notice: 'Reciclador actualizado exitosamente.'
      else
        render :edit
      end
    end
  
    # Método para eliminar un reciclador
    def destroy
      @recycler.destroy
      redirect_to recyclers_url, notice: 'Reciclador eliminado exitosamente.'
    end
    
    
    private
        def set_recycler
            @recycler = Recycler.find(params[:id])
            rescue ActiveRecord::RecordNotFound
            redirect_to recyclers_path, alert: "Reciclador no encontrado"
        end
  
        def recycler_params
        params.require(:recycler).permit(:name, :phone, :address, :email, material_ids: [])
        end

        def authorize_operador_or_admin!
            redirect_to root_path, alert: 'No tienes permiso para acceder a esta página.' unless current_user&.operador?
        end
    end
