Pod::Spec.new do |s|
  s.name              = 'BFKit-Swift'
  s.module_name       = 'BFKit'
  s.version           = '6.0.1'
  s.summary           = 'BFKit-Swift is a collection of useful classes, structs and extensions to develop Apps faster.'
  s.homepage          = 'https://github.com/FabrizioBrancati/BFKit-Swift'
  s.screenshots       = 'https://github.fabriziobrancati.com/bfkit/resources/screenshot-swift.png'
  s.authors           = { 'Fabrizio Brancati' => 'fabrizio.brancati@gmail.com' }
  s.social_media_url  = 'https://twitter.com/infinity4all'
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.source            = { :git => 'https://github.com/FabrizioBrancati/BFKit-Swift.git', :tag => s.version }
  s.documentation_url = 'https://github.fabriziobrancati.com/documentation/BFKit-Swift/'

  s.swift_version             = '5.1'

  s.ios.deployment_target     = '8.0'
  s.ios.source_files          = 'Sources/**/*.swift'
  s.ios.exclude_files         = 'Sources/BFKit/Apple/WatchKit/*.swift'

  s.osx.deployment_target = '10.10'
  s.osx.source_files      =
    'Sources/BFKit/Linux/**/*.swift',
    'Sources/BFKit/Apple/CoreGraphics/*.swift',
    'Sources/BFKit/Apple/Foundation/*.swift',
    'Sources/BFKit/Apple/UIKit/UIColor.swift'

  s.watchos.deployment_target = '3.0'
  s.watchos.source_files      =
    'Sources/BFKit/Linux/**/*.swift',
    'Sources/BFKit/Apple/CoreGraphics/*.swift',
    'Sources/BFKit/Apple/Foundation/*.swift',
    'Sources/BFKit/Apple/UIKit/{UIColor.swift,UIFont.swift,UIImage.swift}',
    'Sources/BFKit/Apple/WatchKit/*.swift'
end
