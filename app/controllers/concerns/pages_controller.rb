class PagesController < ApplicationController

    before_action :check_if_logged_in, only: [:profile]
    # could also do 'except: [:home]'

    before_action :check_if_admin, only: [:admin_party]

    def home
    end

    def profile
      # only visible to logged-in users
    end

    def admin_party
      # only admins get to party
    end

end
