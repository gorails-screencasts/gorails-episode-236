require "application_system_test_case"

class SlideDecksTest < ApplicationSystemTestCase
  setup do
    @slide_deck = slide_decks(:one)
  end

  test "visiting the index" do
    visit slide_decks_url
    assert_selector "h1", text: "Slide Decks"
  end

  test "creating a Slide deck" do
    visit slide_decks_url
    click_on "New Slide Deck"

    fill_in "Name", with: @slide_deck.name
    click_on "Create Slide deck"

    assert_text "Slide deck was successfully created"
    click_on "Back"
  end

  test "updating a Slide deck" do
    visit slide_decks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @slide_deck.name
    click_on "Update Slide deck"

    assert_text "Slide deck was successfully updated"
    click_on "Back"
  end

  test "destroying a Slide deck" do
    visit slide_decks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slide deck was successfully destroyed"
  end
end
