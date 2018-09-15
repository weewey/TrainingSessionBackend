Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'javascripts', 'shared')
Rails.application.config.assets.precompile += %w( emails.css )
