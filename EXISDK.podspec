Pod::Spec.new do |spec|
	spec.name = "EXISDK"
	spec.version = "0.0.7"
	spec.summary = "Personalised exercise prescription"
	spec.homepage = 'https://www.exi.life/sdk-getting-started/'
	spec.author = { "EXI" => "https://info@exi.life" }
	spec.license = 'MIT'
	spec.platform = :ios
	spec.ios.deployment_target = "12.0"
	spec.swift_version = "5.7"
	spec.source = { :git => "https://github.com/exiteam/exi-ios-sdk-framework.git", :tag => spec.version }
	spec.documentation_url = 'https://www.exi.life/exi-ios-sdk-setup/'
    spec.readme = 'https://github.com/exiteam/exi-ios-sdk-framework#readme'
	spec.vendored_frameworks = "EXISDK.xcframework"
    spec.frameworks = 'Foundation'
end