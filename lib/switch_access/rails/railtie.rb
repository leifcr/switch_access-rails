require 'switch_access/rails/view_helpers'

module SwitchAccess
  module Rails
    class Railtie < ::Rails::Railtie
      ActiveSupport.on_load(:action_view) do
        include SwitchAccess::Rails::ViewHelpers
      end
      # initializer "switch_access.rails.view_helpers" do |app|
      #   ActionView::Base.send :include, ViewHelpers
      # end
    end # class Railtie < Rails::Railtie
  end # module Rails
end # module SwitchAccess
