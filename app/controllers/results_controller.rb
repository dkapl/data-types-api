class ResultsController < ApplicationController
  before_action :verify_company_id, :verify_data_type

  def index
    case params[:type]
    when "alpha"
      @file = File.read("lib/data/alpha.json")
    when "beta"
      @file = File.read("lib/data/beta.json")
    when "gama"
      @file = File.read("lib/data/gama.json")
    when "omega"
      @file = File.read("lib/data/omega.json")
    end

    render :json => @file, :status => 200
  end

  def verify_company_id
    unless params[:company_id] && params[:company_id] == "124423"
      render :json => { :errors => "No data found! Please specify correct company ID!" },
             :status => 400
    end
  end

  def verify_data_type
    unless ["alpha", "beta", "gama", "omega"].include?(params[:type])
      render :json => { :errors => "No data found! Please specify correct data type!" },
             :status => 400
    end
  end
end