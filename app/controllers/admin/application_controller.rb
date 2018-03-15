# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :deny_access, unless: :logged_and_admin?

    protected

    def deny_access
      flash[:alert] = "Vous n'êtes pas administrateur"
      redirect_to root_path
    end

    def logged_and_admin?
      current_user && current_user.admin?
    end

    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
