class Adm::PagesController < ApplicationController

  before_action :authenticate_user!

  layout "adm_layout"

  def index
    @jum = Menu.where(level_kode: current_user.level_kode).count
    if @jum == 0
      @m = Menu.new(level_kode: current_user.level_kode)
      @m.save
      @data = Menu.where(level_kode: current_user.level_kode).first
    end
  end #def index

  def edit
    @field = params[:ef]
    @data = Menu.where(level_kode: current_user.level_kode).first
  end

  def simpan
    @data = Menu.where(level_kode: current_user.level_kode).first

    @menu_profil = params[:menu][:menu_profil]
    @menu_rpjmd = params[:menu][:menu_rpjmd] 
    @menu_visimisi = params[:menu][:menu_visimisi]
    @menu_skpd = params[:menu][:menu_skpd]
    @menu_urusan = params[:menu][:menu_urusan]
    @menu_program = params[:menu][:menu_program]
    @menu_rka = params[:menu][:menu_rka]
    @menu_lpj = params[:menu][:menu_lpj]
    @menu_prestasi = params[:menu][:menu_prestasi]

    if @menu_profil
      @data.menu_profil =  @menu_profil
    elsif @menu_rpjmd
      @data.menu_rpjmd =  @menu_rpjmd
    elsif @menu_visimisi
      @data.menu_visimisi =  @menu_visimisi
    elsif @menu_skpd
      @data.menu_skpd =  @menu_skpd
    elsif @menu_urusan
      @data.menu_urusan =  @menu_urusan
    elsif @menu_program
      @data.menu_program =  @menu_program
    elsif @menu_rka
      @data.menu_rka =  @menu_rka
    elsif @menu_lpj
      @data.menu_lpj =  @menu_lpj
    elsif @menu_prestasi
      @data.menu_prestasi =  @menu_prestasi
    end

    @data.save

    redirect_to '/adm/pages'

  end

end
