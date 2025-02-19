# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'ChitChaT' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ChitChaT
	pod 'CLTypingLabel', '~> 0.4.0'
  pod 'IQKeyboardManagerSwift', '~> 6.5.0'
  pod 'FirebaseAuth'
  pod 'FirebaseFirestore'
	
  target 'ChitChaTTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ChitChaTUITests' do
    # Pods for testing
  end

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    # Check if the target name includes 'BoringSSL' or 'GRSP'
    if target.name.include?("BoringSSL") || target.name.include?("GRSP")
      target.build_configurations.each do |config|
        # Remove -G flag from OTHER_LDFLAGS if present
        if config.build_settings['OTHER_LDFLAGS']
          config.build_settings['OTHER_LDFLAGS'] = config.build_settings['OTHER_LDFLAGS'].reject { |flag| flag.include?("-G") }
        end
        # Optionally, check and remove from OTHER_CFLAGS if needed
        if config.build_settings['OTHER_CFLAGS']
          config.build_settings['OTHER_CFLAGS'] = config.build_settings['OTHER_CFLAGS'].reject { |flag| flag.include?("-G") }
        end
      end
    end
  end
end
