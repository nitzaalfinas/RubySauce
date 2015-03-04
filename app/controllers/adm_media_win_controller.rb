class AdmMediaWinController < ApplicationController


	def index
		rows = params[:rows].to_i
		sortx = params[:sort]
		orderx = params[:order]

		#mencari offset
		if(!params[:page])
			page = 1
		else
			page = params[:page].to_i
		end

		startx = (page - 1) * rows

		orderxx = sortx+" "+orderx

		total = Media.all.size

		@media = Media.order(orderxx).limit(rows).offset(startx)

		@next_page = page + 1
		@prev_page = page - 1

		render :partial => "index"
		
	end #def index


	def the_page
		rows = params[:rows].to_i
		sortx = params[:sort]
		orderx = params[:order]

		#mencari offset
		if(!params[:page])
			page = 1
		else
			page = params[:page].to_i
		end

		startx = (page - 1) * rows

		orderxx = sortx+" "+orderx

		total = Media.all.size

		@media = Media.order(orderxx).limit(rows).offset(startx)

		@next_page = page + 1
		@prev_page = page - 1

		render :partial => "the_page"
	end #def the_page

end
