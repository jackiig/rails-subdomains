require 'test_helper'


class Subdomains::ParsesSubdomainsTest < ActionController::TestCase
  tests TestController
  def setup
    @request.host = 'baz.l_bar.foo.example.com'
  end
  test "sets attributes after position request" do
    # See the test controller implementation.
    get :position
    assert_response :success
    assert_equal "foo", response.body
  end
  test "sets attributes after regex request" do
    # See the test controller implementation.
    get :regex
    assert_response :success
    assert_equal "bar", response.body
  end
  test "gets nil if no matches" do
    # See the test controller implementation.
    @request.host = 'example.com'
    get :regex
    assert_response :success
    assert_equal "", response.body
    get :position
    assert_response :success
    assert_equal "", response.body
  end
end
