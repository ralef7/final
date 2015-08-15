if !Rails.env.production?
Blog.delete_all
User.delete_all
end

rob = User.create(:username => 'rob231', :email => 'robmoney@gmail.com', :birthdate =>  '10/10/1986', :sex => 'male', :password_digest => 'kashkow456')
davis = User.create(:username => 'davis45', :email => 'davis@gmail.com', :birthdate => '05/10/1966', :sex => 'female', :password_digest => 'digme123')
gret = User.create(:username => 'gretzky1', :email => 'gitit75@gmail.com', :birthdate => '01/12/1956', :sex => 'male', :password_digest => 'hello89')
bhawk = User.create(:username => 'blackhawk2', :email => 'howmuchy7@gmail.com', :birthdate => '01/11/1978', :sex => 'female', :password_digest => 'password') 

collie = Blog.create(:user_id => rob.id, :name => 'Collie Dogs', :description => 'Your blog for everything about collies')
jiujits = Blog.create(:user_id => davis.id, :name => 'Brazilian Jiu Jitsu Blog', :description => 'Your blog for everything about Brazilian Jiu Jitsu')
hockey = Blog.create(:user_id => gret.id, :name => 'Hockey Blog', :description => 'Your blog for everything hockey')
ruby = Blog.create(:user_id => bhawk.id, :name => 'Ruby Rails', :description => 'Your blog for everything about ruby rails')

Post.create(:blog_id => collie.id, :title => 'Hello Collie World!', :text => 'this is my first collie post')
Post.create(:blog_id => jiujits.id, :title => 'Hello Jiu Jitsu World!', :text => 'this is my first jj post')
Post.create(:blog_id => jiujits.id, :title => 'Hello Jiu Jitsu World Again!', :text => 'this is my second jj post')
Post.create(:blog_id => hockey.id, :title => 'Hello Hockey World!', :text => 'I hope Patrick Kane is innocent')
Post.create(:blog_id => ruby.id, :title => 'Hello Ruby World!', :text => 'welcome to ruby!')

