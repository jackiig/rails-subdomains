module Subdomains
  class Match
    class Regex
      def initialize(regex)
        @regex = regex
      end
      def match(parts)
        parts.each do |part|
          if match = @regex.match(part)
            return match[1]
          end
        end
        return nil
      end
    end
  end
end
