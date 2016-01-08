##Description
 This application is a personal blog demo, use Ruby on Rails implement
 
##Technology Stack
* ruby 2.1.1
* rails 4.2.0
 
##How To Run

1. clone the appliction
2. make sure your evironment have ruby and rails, if your environment don't have these , you can fllow this blow link to set up Rails enviroment :

	[How to set up Ruby on Rails](https://ruby-china.org/wiki/install_ruby_guide)
	
3. install all dependency gems use bundle command :

		bundle install	 
 

4. rename the database config file to database.yml and config yourself database, database conifg file is in 

		config/database.yml.example
		
5. migrate database use command :

		bundle exec rake db:migrate 
		
6. use blow rake task to initilize admin username and password:

		bundle exec rake init_user:create_admin
		
7. run server use :

		rails s
	

	
		