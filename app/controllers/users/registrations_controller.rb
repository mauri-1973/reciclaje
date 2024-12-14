class Users::RegistrationsController < Devise::RegistrationsController
  # Sobreescribe las acciones innecesarias para evitar que se usen
  def new
    redirect_to root_path, alert: 'El registro de usuarios no está permitido.'
  end

  def create
    redirect_to root_path, alert: 'El registro de usuarios no está permitido.'
  end
end
