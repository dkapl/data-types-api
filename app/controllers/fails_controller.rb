class FailsController < ApplicationController
  def four_oh_four
    render :json => { :errors => "URL not found" },
           :status => 404
  end
end