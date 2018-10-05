begin
  permissions = "#{Rails.root}/config/permissions.yml"
  config = YAML.load_file(permissions)[Rails.env]
  PERMISSIONS = config.map { |key, value| [key.to_sym, value] }.to_h
rescue
  Rails.logger.error('An error occured while loading permissions.yml')
end
PERMISSIONS ||= {}
