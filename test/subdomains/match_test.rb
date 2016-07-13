require 'test_helper'

class Subdomains::Match::Test < ActiveSupport::TestCase
  def setup
    @regex = Subdomains::Match.new(regex: /l_(.*)/)
    @position = Subdomains::Match.new(position: 2)
    byebug
  end
  test "truth" do
    assert_kind_of Class, Subdomains::Match
    assert_kind_of Class, Subdomains::Match::Regex
    assert_kind_of Class, Subdomains::Match::Position
  end
  test "dispatches to sub classes" do
    assert_instance_of Subdomains::Match::Regex, @regex.matcher
    assert_instance_of Subdomains::Match::Position, @position.matcher
  end
  test "regex returns the matched value" do
    assert_equal '123', @regex.match('l_123')
    assert_equal '123', @regex.match('asdf.l_123')
  end
  test "regex returns nil if unmatched" do
    assert_equal nil, @regex.match('test.google.com')
  end
  test "position returns second object from the right" do
    assert_equal '123', @position.match('123.456')
    assert_equal '123', @position.match('789.123.456')
    assert_equal 'stuff', @position.match('321.789.stuff.456')
    # TODO:  Is this actually useful?  Not sure.
    assert_equal '', @position.match('123.123..123')
  end
  test "position returns nil if position doesn't exist" do
    assert_equal nil, @position.match('123')
    assert_equal nil, @position.match('321_789_123_456')
  end
end
