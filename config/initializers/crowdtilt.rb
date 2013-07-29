module Crowdtilt

	def self.sandbox
		self.configure api_key: 'c3afb05a171cfa532916fca9a70557',
	                 api_secret: '466121cec9a2f0d7e644b4366a9f70de38a2f6f3',
	                 mode: 'sandbox'
	end
	
	def self.production
		self.configure api_key: Rails.configuration.crowdtilt_production_key,
	                 api_secret: Rails.configuration.crowdtilt_production_secret,
	                 mode: 'production'
	end

end

# Initialize sandbox mode by default
Crowdtilt.sandbox
