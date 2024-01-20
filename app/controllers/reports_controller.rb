class ReportsController < ApplicationController
  before_action :set_reportable


  def create
    @report = @reportable.reports.build(user: current_user)
    authorize @report

    if @report.saverender json: { message: 'Content reported successfully' }
  else
    render json: { error: 'Unable to report content' }, status: :unprocessable_entity
    end
  end


  private

  def set_reportable
    @reportable = Article.find(params[:article_id])
  end

end
