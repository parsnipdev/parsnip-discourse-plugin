class ParsnipPluginConstraint
  def matches?(request)
    SiteSetting.parsnip_plugin_enabled
  end
end
