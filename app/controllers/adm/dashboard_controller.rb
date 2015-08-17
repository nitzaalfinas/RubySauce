class Adm::DashboardController < ApplicationController

	before_action :authenticate_user!

	helper Adm::Helper # to call from view
  include Adm::Helper # to call within controller

	layout "adm_layout"

	def index
	end

end
