require 'test_helper'

class BookCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get book_comments_show_url
    assert_response :success
  end

  test "should get new" do
    get book_comments_new_url
    assert_response :success
  end

  test "should get index" do
    get book_comments_index_url
    assert_response :success
  end

  test "should get edit" do
    get book_comments_edit_url
    assert_response :success
  end

end
