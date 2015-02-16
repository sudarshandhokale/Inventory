class RegistrationsController < Devise::RegistrationsController
  before_filter :check_user, only: :new

  private

  def check_user
    redirect_to home_index_path if User.first
  end
end
