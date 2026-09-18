Pod::Spec.new do |spec|
spec.name               = "FrisbuyStoriesSDK"
spec.version            = "1.0.78"
spec.summary            = "FrisbuyStories Library for iOS apps"
spec.description        = "Frisbuy Stories Library for iOS apps"
spec.homepage           = 'https://github.com/FrisbuyDev/frisbuy-ios-sdk-binaries'
spec.documentation_url  = "..."
spec.license            = { :type => 'MIT', :file => 'LICENSE' }
spec.author             = { "Frisbuy" => "..." }
spec.source             = { :git => 'https://github.com/FrisbuyDev/frisbuy-ios-sdk-binaries', :tag => '1.0.78' }
# { :git => 'https://github.com/FrisbuyDev/frisbuy-ios-sdk-binaries', :tag => '1.0.78' }
# { :path => '/Users/i/frisbuy-ios-sdk-binaries'}


spec.swift_version      = "5.0"


# Supported deployment targets
spec.ios.deployment_target  = "13.0"

# Published binaries
     spec.vendored_frameworks = "Artifacts/FrisbuyStoriesSDK.xcframework"
end
