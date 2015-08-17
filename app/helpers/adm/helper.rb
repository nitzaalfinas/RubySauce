module Adm::Helper

  $appset = Option.first
  
	def adm_check (user_level)
		if user_level != "Admin"
			redirect_to "/"
		end #if current_user != "Admin"
	end #def adm_check

end
