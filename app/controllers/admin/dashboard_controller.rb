class Admin::DashboardController < ApplicationController
http_basic_authenticate_with name: ENV['Admin_Login'], password: ENV['Admin_password']
  def show
  end
end
