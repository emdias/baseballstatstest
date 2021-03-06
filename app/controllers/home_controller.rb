class HomeController < ApplicationController
  before_filter :init_params

  def index
    @q = PlayerSeasonStat.ransack(params[:q])
    @players = @q.result
                   .includes(:player)
                   .paginate(page: params[:page], per_page: 25)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def init_params
    params[:sort] ||= {}
    params[:q] ||= {s: 'avg desc'}
  end

end