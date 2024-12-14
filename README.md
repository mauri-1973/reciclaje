# README

Prueba de Evalución Final

* rails new reciclaje -d postgresql
* Instalando figaro (gem install figaro, bundle exec figaro install )
* Configuración de credenciales para la base de datos
* Creando Bases de datos (riciclaje_oscarzambrano riciclaje_test_oscarzambrano, rails db:create)
* Agregando gemas
* gem install bootstrap
* gem install jquery-rails
* gem install popper_js
* gem install sassc-rails
* gem install faker
* gem install figaro
* bundle install
* Configuración de Boostrap, jquery, popper, sassc
* cambiar de nombre app\assets\stylesheets\application.css a app\assets\stylesheets\application.scss
* agregar en app\assets\stylesheets\application.scss la linea @import "bootstrap";
* agregar en app\javascript\application.js las líneas import "bootstrap" import "popper"
* agregar en config\initializers\assets.rb Rails.application.config.assets.precompile += %w( application.scss bootstrap.min.js popper.js )
* agregar en config\importmap.rb pin "popper", to: 'popper.js', preload: true pin "bootstrap", to: 'bootstrap.min.js', preload: true
* Ejecutar bundle install
* gem install divice
* bundle add devise
* rails generate devise:install
* rails g devise:views
* rails generate devise user
* rails generate devise:controllers users
* rails generate migration AddRoleToUsers role:integer (Agregando roles)
* rails db:migrate
* rails generate model Recycler phone:string name:string address:string email:string
* rails generate model Material name:string description:string recycler:references
* rails generate model Delivery material:references delivery_date:date quantity:integer recycler:references
* Generar las asociaciones en los modelos
* class Recycler < ApplicationRecord
    has_many :materials, dependent: :destroy
    has_many :deliveries, dependent: :destroy
    validates :name, :phone, :address, :email, presence: true
end
* class Material < ApplicationRecord
  belongs_to :recycler
  validates :name, :description, presence: true
end
* class Delivery < ApplicationRecord
  belongs_to :material
  belongs_to :recycler
  validates :date, :quantity, presence: true
end
* rails db:migrate
* crear datos de prueba con faker
* rails db:seed
* Crear los controladores
* rails generate controller Recyclers
* rails generate controller Materials
* rails generate controller Deliveries
* Configuramos las rutas
