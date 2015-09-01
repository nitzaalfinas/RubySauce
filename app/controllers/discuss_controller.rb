class DiscussController < ApplicationController
  
  helper Adm::Helper # to call from view
  include Adm::Helper # to call within controller

  def send_insert
    @discuss = Discuss.new
    @discuss.article_id = params[:article_id]
    @discuss.user_id = current_user.id
    @discuss.dis_body = params[:dis_body]
    @discuss.dis_approve = "no"
    @discuss.save
    render inline: "sucess"
  end #sendi_insert
end
