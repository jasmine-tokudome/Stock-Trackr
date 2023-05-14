# -*- encoding: utf-8 -*-
# stub: font_awesome5_rails 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "font_awesome5_rails".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["tomkra".freeze]
  s.date = "2021-06-14"
  s.description = "font_awesome5_rails provides Font-Awesome 5 support.".freeze
  s.email = ["kralutomas@gmail.com".freeze]
  s.homepage = "https://github.com/tomkra/font_awesome5_rails".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.4.12".freeze
  s.summary = "an asset gemification of the font-awesome 5 icon font library".freeze

  s.installed_by_version = "3.4.12" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<railties>.freeze, [">= 4.2"])
  s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.11.3"])
  s.add_development_dependency(%q<activesupport>.freeze, [">= 4.2"])
  s.add_development_dependency(%q<sass-rails>.freeze, [">= 0"])
end
