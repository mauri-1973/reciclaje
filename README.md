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

* Agregamos un índice a la tabla recicladores, para evitar duplicados
* rails generate migration add_index_to_recyclers_email
* rails db:migrate
* gem install kaminari
* bundle add kaminari
* rails g kaminari:views bootstrap4
* configurar render
* Crear archivo en  bin\render-build.sh
* dar los permisos chmod a+x bin\render-build.sh
* agregar render.yaml con las instrucciones básicas de render
* subir el repositorio a git con la aplicación y sus funcionalidades operativas
* Ingresar al render y configurar el panel de control
* desplegar
* Agregando buscador vista recicladores


<image src="/imagenes/1.png" alt="Descripción de la imagen">
<image src="/imagenes/2.png" alt="Descripción de la imagen">
<image src="/imagenes/3.png" alt="Descripción de la imagen">
<image src="/imagenes/4.png" alt="Descripción de la imagen">
<image src="/imagenes/5.png" alt="Descripción de la imagen">
<image src="/imagenes/6.png" alt="Descripción de la imagen">
<image src="/imagenes/7.png" alt="Descripción de la imagen">
<image src="/imagenes/8.png" alt="Descripción de la imagen">