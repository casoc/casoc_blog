# encoding: utf-8
namespace :init_user do
  desc 'init admin'
  task create_admin: :environment do
    new_user = {}
    puts "Please input user name for admin:"
    new_user[:user_name] = STDIN.gets.chomp
    puts "Please input user email:"
    new_user[:email] = STDIN.gets.chomp
    puts "Please input user password:"
    new_user[:password] = STDIN.gets.chomp
    puts "Please confirm your password:"
    new_user[:password_confirmation] = STDIN.gets.chomp
    new_user[:admin] = 1

    user = Admin::User.new(new_user)
    if user.save
      puts "create success！"
    else
      user.errors.full_messages.each { |message| puts message }
    end
  end
end
