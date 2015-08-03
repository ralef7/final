if !Rails.env.production?
Blog.delete_all
User.delete_all
end

rob = User.create(:username => 'rob231', :email => 'robmoney@gmail.com', :birthdate =>  '10/10/1986', :sex => 'male', :password => 'kashkow456')
davis = User.create(:username => 'davis45', :email => 'davis@gmail.com', :birthdate => '05/10/1966', :sex => 'female', :password => 'digme123')
gret = User.create(:username => 'gretzky1', :email => 'gitit75@gmail.com', :birthdate => '01/12/1956', :sex => 'male', :password => 'hello89')
bhawk = User.create(:username => 'blackhawk2', :email => 'howmuchy7@gmail.com', :birthdate => '01/11/1978', :sex => 'female', :password => 'password') 

Blog.create(:user_id => rob.id, :name => 'Collie Dogs', :description => 'Your blog for everything about collies')
Blog.create(:user_id => davis.id, :name => 'Brazilian Jiu Jitsu Blog', :description => 'Your blog for everything about Brazilian Jiu Jitsu')
Blog.create(:user_id => gret.id, :name => 'Hockey Blog', :description => 'Your blog for everything hockey')
Blog.create(:user_id => bhawk.id, :name => 'Ruby Rails', :description => 'Your blog for everything about ruby rails')
