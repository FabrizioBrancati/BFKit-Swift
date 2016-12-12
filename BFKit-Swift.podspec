Pod::Spec.new do |s|
  s.name             = "BFKit-Swift"
  s.module_name      = "BFKit"
  s.version          = "2.0.2"
  s.summary          = "BFKit Swift is a collection of useful classes, structs and extensions to develop Apps faster."
  s.homepage         = "https://github.com/FabrizioBrancati/BFKit-Swift"
  s.screenshots      = "http://github.fabriziobrancati.com/bfkit/resources/screenshot-swift.png"
  s.license          = {
                          :type => "MIT",
                          :file => "LICENSE"
                       }
  s.author           = { "Fabrizio Brancati" => "fabrizio.brancati@gmail.com" }
  s.social_media_url = "https://twitter.com/infinity4all"
  s.platform         = :ios, "8.0"
  s.source           = {
                          :git => "https://github.com/FabrizioBrancati/BFKit-Swift.git",
                          :tag => s.version
                       }
  s.source_files     = "Sources/**/*.{swift}"
  s.requires_arc     = true
end
