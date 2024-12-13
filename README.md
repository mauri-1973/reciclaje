# README

Prueba de Evalución Final

* rails new reciclaje -d postgresql

* Instalando figaro (gem install figaro, bundle exec figaro install )

* Configuración de credenciales para la base de datos

* Creando Bases de datos (riciclaje_oscarzambrano riciclaje_test_oscarzambrano, rails db:create)

* Agregando gemas
    gem install bootstrap
    gem install jquery-rails
    gem install popper_js
    gem install sassc-rails
    gem install faker
    gem install figaro

    bundle install

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

*
