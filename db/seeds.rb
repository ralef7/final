if !Rails.env.production?
Blog.delete_all
User.delete_all
Post.delete_all
Comment.delete_all
Follow.delete_all
end

rob = User.create(:username => 'rob231', :email => 'robmoney@gmail.com', :birthdate =>  '10/10/1986', :sex => 'male', :password => 'password')
davis = User.create(:username => 'davis45', :email => 'davis@gmail.com', :birthdate => '05/10/1966', :sex => 'female', :password => 'password')
gret = User.create(:username => 'gretzky1', :email => 'gitit75@gmail.com', :birthdate => '01/12/1956', :sex => 'male', :password => 'password')
bhawk = User.create(:username => 'blackhawk2', :email => 'howmuchy7@gmail.com', :birthdate => '01/11/1978', :sex => 'female', :password => 'password') 

collie = Blog.create(:user_id => rob.id, :name => 'Collie Dogs', :description => 'Your blog for everything about collies')
jiujits = Blog.create(:user_id => davis.id, :name => 'Brazilian Jiu Jitsu Blog', :description => 'Your blog for everything about Brazilian Jiu Jitsu')
hockey = Blog.create(:user_id => gret.id, :name => 'Hockey Blog', :description => 'Your blog for everything hockey')
ruby = Blog.create(:user_id => bhawk.id, :name => 'Ruby Rails', :description => 'Your blog for everything about ruby rails')

c1 = Post.create(:blog_id => collie.id, :title => 'Hello Collie World!', :text => 'this is my first collie post')
j1 = Post.create(:blog_id => jiujits.id, :title => 'Hello Jiu Jitsu World!', :text => 'this is my first jj post')
j2 = Post.create(:blog_id => jiujits.id, :title => 'Hello Jiu Jitsu World Again!', :text => 'this is my second jj post')
h1 = Post.create(:blog_id => hockey.id, :title => 'Hello Hockey World!', :text => 'I hope Patrick Kane is innocent')
r1 = Post.create(:blog_id => ruby.id, :title => 'Hello Ruby World!', :text => 'welcome to ruby!')

Comment.create(:post_id => c1.id, :user_id => rob.id, :title => "love it", :text => "This is really great")
Comment.create(:post_id => c1.id, :user_id => davis.id, :title => "like it", :text => "This is pretty good")
Comment.create(:post_id => j1.id, :user_id => bhawk.id, :title => "Good", :text => "This fun")
Comment.create(:post_id => j2.id, :user_id => rob.id, :title => "love it", :text => "This is really great")
Comment.create(:post_id => r1.id, :user_id => rob.id, :title => "love it", :text => "This is really great")
Comment.create(:post_id => r1.id, :user_id => gret.id, :title => "love it", :text => "This is really great")

Follow.create(:user_id => rob.id, :blog_id => ruby.id)
Follow.create(:user_id => gret.id, :blog_id => jiujits.id)
Follow.create(:user_id => bhawk.id, :blog_id => collie.id)
Follow.create(:user_id => rob.id, :blog_id => jiujits.id)
Follow.create(:user_id => bhawk.id, :blog_id => hockey.id)
Follow.create(:user_id => davis.id, :blog_id => collie.id)

