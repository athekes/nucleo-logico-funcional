require 'test_helper'
require 'rails/performance_test_help'
 
# Profiling results for each test method are written to tmp/performance.
class UsersTest < ActionDispatch::PerformanceTest

  
  def test_create_user
    post '/users', params: { user: { name: 'teste' }}, headers: { 'Content-Type': 'application/json' }
  end
end