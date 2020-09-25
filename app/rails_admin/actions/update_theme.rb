# frozen_string_literal: true
require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
require './app/rails_admin/actions/custom_action'

module RailsAdmin
  module Config
    module Actions
      class UpdateTheme < Customaction
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :only do
          User
        end
        register_instance_option :link_icon do
          'fa fa-wrench' # use any of font-awesome icons
        end
        register_instance_option :http_methods do
          [:get, :post]
        end
        register_instance_option :controller do
          Proc.new do
            @object.update_theme
            flash[:notice] = "Update theme"
            redirect_to back_or_index
          end
        end
      end
    end
  end
end
