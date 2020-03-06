# frozen_string_literal: true

# name: ParsnipPlugin
# about: Customize Discourse for Parsnip
# version: 0.1
# authors: bennettrogers
# url: https://github.com/bennettrogers

register_asset 'stylesheets/common/parsnip-plugin.scss'
register_asset 'stylesheets/desktop/parsnip-plugin.scss', :desktop
register_asset 'stylesheets/mobile/parsnip-plugin.scss', :mobile

enabled_site_setting :parsnip_plugin_enabled

PLUGIN_NAME ||= 'ParsnipPlugin'

load File.expand_path('lib/parsnip-plugin/engine.rb', __dir__)

after_initialize do
  # https://github.com/discourse/discourse/blob/master/lib/plugin/instance.rb
  add_to_serializer(:post, :user_extra_fields, false) {
    return object.user.custom_fields
  }
end
