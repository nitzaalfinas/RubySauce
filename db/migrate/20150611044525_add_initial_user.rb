class AddInitialUser < ActiveRecord::Migration
  def up
    
    #pass = 11111111
    
    self.connection.execute %Q( 
      INSERT INTO users 
(id, email, encrypted_password, level, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at) 
VALUES
(1, 'admin@email.com', '$2a$10$xdPcJu3hEfupjBUCYVImPuU0uba3Sr.ha.k9KdHeAc0txplDhVeDq', 'Admin', NULL, NULL, NULL, 1, '2015-06-11 00:00:33', '2015-06-11 00:00:33', '127.0.0.1', '127.0.0.1', '710d726ab25a5bd517cba7ce1f6ce5b9f62606f06f8030eac0693b345b529c86', '2015-06-10 23:59:13', '2015-06-10 23:59:13', NULL, '2015-06-10 23:59:13', '2015-06-11 00:00:33');
	 	)
  end
 
  def down
    User.delete_all
  end
end
