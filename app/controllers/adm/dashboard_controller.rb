class Adm::DashboardController < ApplicationController

	before_action :authenticate_user!

	include Adm::Helper

	layout "adm_layout"

	def index
	end

end
