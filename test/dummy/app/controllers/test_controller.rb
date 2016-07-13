class TestController < ApplicationController
  parse_subdomains(position: 1, callback: :set_position)
  parse_subdomains(regex: /l_(.+)/, callback: :set_regex)
  def set_position(value)
    @position = value
  end
  def set_regex(value)
    @regex = value
  end
  def position
    render plain: @position
  end
  def regex
    render plain: @regex
  end
end
