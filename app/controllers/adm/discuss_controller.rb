class Adm::DiscussController < ApplicationController

  before_action :authenticate_user!

  layout "adm_layout"

  def index
    @discusses = VDiscuss.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)

  end #index

  def approve
    @discuss_id = params[:discuss_id]
    @discuss = Discuss.find(@discuss_id.to_i)
    @discuss.dis_approve = "yes"
    @discuss.save
    render inline: "success"
  end #approve

  def disapprove
    @discuss_id = params[:discuss_id]
    @discuss = Discuss.find(@discuss_id.to_i)
    @discuss.dis_approve = "no"
    @discuss.save
    render inline: "success"
  end #unapprove
  
  def destroy
    @id = params[:id].to_i
    Discuss.find(@id).destroy
    
    redirect_to adm_discuss_path(:page => params[:page])
  end
  
end
