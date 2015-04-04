Pod::Spec.new do |s|
  s.name         = "Injector"
  s.version      = "0.0.3"
  s.summary      = "Injector provides a lightweight framework for binding and injecting services at runtime."

  s.description  = <<-DESC
                   Injector provides a lightweight framework for binding and injecting services at runtime.

                   ### Why use Injector?
                   * Divide your code into standalone components.
                   * Swap implementations of these components easily.

                   See https://github.com/nsrandom/injector for a more detailed description and example code.
                   DESC

  s.homepage     = "https://github.com/nsrandom/injector"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author               = "NSRandom"
  s.social_media_url   = "https://twitter.com/nsrandom"

  s.source       = { :git => "https://github.com/nsrandom/injector.git", :tag => "0.0.3" }
  s.source_files  = "Injector", "Injector/**/*.{h,m}"
  s.public_header_files = "Injector/**/*.h"

  # s.platform       = :ios, "6.0"
  s.requires_arc = true
end
