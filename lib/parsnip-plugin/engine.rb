module ParsnipPlugin
  class Engine < ::Rails::Engine
    engine_name "ParsnipPlugin".freeze
    isolate_namespace ParsnipPlugin

    config.after_initialize do
      Discourse::Application.routes.append do
        mount ::ParsnipPlugin::Engine, at: "/parsnip-plugin"
      end
    end
  end
end
