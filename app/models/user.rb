class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { operador: 0, administrador: 1 }

  # Métodos para verificar roles
  def operador?
    role == "operador"
  end

  def administrador?
    role == "administrador"
  end
  
end
