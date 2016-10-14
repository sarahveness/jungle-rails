class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHUSERNAME'], password: ENV['AUTHPASSWORD']

  def show
  end
end
