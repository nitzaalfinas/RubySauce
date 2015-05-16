# RoR-CMS
CMS based on Ruby on Rails

How to setup;<br>
1. Setup the database; name, username and password.<br>
2. Run the following command in the command line to load the database
<pre>$ rake db:setup RAILS_ENV=development</pre>
<br>
3. Sign in;<br>
email: admin@email.com<br>
password: 11111111<br>
<br>
<h3>Prevent user from sign up</h3>
If the application for personal use and you don't want another user for the application, you can remove sign up URL.<br>
Open app/models/user.rb and remove :registerable so your file look like below;
<pre>
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
end
</pre>

More information about devise: https://github.com/plataformatec/devise
