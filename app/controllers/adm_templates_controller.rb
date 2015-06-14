class AdmTemplatesController < ApplicationController
  
  before_action :authenticate_user!

	include AdmHelper

	layout "adm_layout"
  
  def index
    @default = Template.where(:active => 1).take
    @templates = Template.all
  end
  
  def new
    @template = Template.new
  end
end
