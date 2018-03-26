require 'test_helper'

class SlideDecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slide_deck = slide_decks(:one)
  end

  test "should get index" do
    get slide_decks_url
    assert_response :success
  end

  test "should get new" do
    get new_slide_deck_url
    assert_response :success
  end

  test "should create slide_deck" do
    assert_difference('SlideDeck.count') do
      post slide_decks_url, params: { slide_deck: { name: @slide_deck.name } }
    end

    assert_redirected_to slide_deck_url(SlideDeck.last)
  end

  test "should show slide_deck" do
    get slide_deck_url(@slide_deck)
    assert_response :success
  end

  test "should get edit" do
    get edit_slide_deck_url(@slide_deck)
    assert_response :success
  end

  test "should update slide_deck" do
    patch slide_deck_url(@slide_deck), params: { slide_deck: { name: @slide_deck.name } }
    assert_redirected_to slide_deck_url(@slide_deck)
  end

  test "should destroy slide_deck" do
    assert_difference('SlideDeck.count', -1) do
      delete slide_deck_url(@slide_deck)
    end

    assert_redirected_to slide_decks_url
  end
end
