# Be sure to restart your server when you modify this file.
Rails.application.config.assets.precompile += %w( css/animate.min.css)
Rails.application.config.assets.precompile += %w( css/custom.css)
Rails.application.config.assets.precompile += %w( css/icheck/flat/green)
Rails.application.config.assets.precompile += %w( css/floatexamples)
Rails.application.config.assets.precompile += %w( css/normalize)
Rails.application.config.assets.precompile += %w( css/ion.rangeSlider)
Rails.application.config.assets.precompile += %w( pace.css)
Rails.application.config.assets.precompile += %w( style.css )

Rails.application.config.assets.precompile += %w( selectize.bootstrap3.css )
Rails.application.config.assets.precompile += %w( selectize )
Rails.application.config.assets.precompile += %w( selectize.min )
Rails.application.config.assets.precompile += %w( plugin )
Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( jquery.dataTables.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( jquery.dataTables.min.css )
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( footermanifest.js)
