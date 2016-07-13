require 'subdomains/match/position'
require 'subdomains/match/regex'

module Subdomains
  class Match
    def self.for_regex(regex)
      return self.class.new(regex: regex)
    end

    def self.for_position(position)
      return self.class.new(position: position)
    end

    def initialize(options)
      if options.has_key? :regex
        @matcher = Subdomains::Match::Regex.new(options[:regex])
      else
        @matcher = Subdomains::Match::Position.new(options[:position])
      end
    end

    def match(full_domain)
      @matcher.match(full_domain.split('.'))
    end

    def matcher
      @matcher
    end
  end
end
