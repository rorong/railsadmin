# frozen_string_literal: true
require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Customaction < RailsAdmin::Config::Actions::Base
        register_instance_option :member do  #	this is for specific record
          true
        end
        register_instance_option :pjax? do
          false
        end
        register_instance_option :visible? do
          authorized? 		# This ensures the action only shows up for the right class
        end
      end
    end
  end
end
