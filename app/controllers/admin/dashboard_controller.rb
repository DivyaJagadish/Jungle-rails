class Admin::DashboardController < ApplicationController
 http_basic_authenticate_with name:env.Admin_Login, password: env.Admin_password
  def show
  end
end
