path = File.join(Rails.root, "config/twilio.yml")
TWILIO_CONFING = YAML.load(File.read(path))[Rails.env] || {'sid' => '', 'from' => '', 'token' => '' }