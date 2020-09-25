# frozen_string_literal: true
require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
require './app/rails_admin/actions/custom_action'

module RailsAdmin
  module Config
    module Actions
      class LoginAs < Customaction
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :only do
          User
        end

        register_instance_option :link_icon do
          'fa fa-sign-in' # use any of font-awesome icons
        end

        register_instance_option :http_methods do
          [:get, :post]
        end

        register_instance_option :controller do
          Proc.new do
            sign_in(@object, bypass: true)
            session[:admin_user] = true
            redirect_to '/'
          end
        end
      end
    end
  end
end
