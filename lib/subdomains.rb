require 'subdomains/match'

module Subdomains
  extend ActiveSupport::Concern

  included do |base|
    before_action :match_subdomains
    def match_subdomains
      unless subdomains_selectors.empty?
        subdomains_selectors.each do |selector|
          self.send selector[:callback], selector[:matcher].match(request.subdomain)
        end
      end
    end
  end

  class_methods do
    def parse_subdomains(options)
      cattr_accessor :subdomains_selectors
      self.subdomains_selectors ||= Array.new
      self.subdomains_selectors.push(
        callback: options[:callback],
        matcher: Subdomains::Match.new(options),
      )
    end
  end
end
