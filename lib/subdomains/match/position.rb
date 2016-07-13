module Subdomains
  class Match
    class Position
      def initialize(position)
        @position = position
      end

      def match(parts)
        parts.reverse!
        if part = parts.at(@position - 1)
          return part
        else
          return nil
        end
      end
    end
  end
end
