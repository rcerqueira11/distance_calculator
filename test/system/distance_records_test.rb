require "application_system_test_case"

class DistanceRecordsTest < ApplicationSystemTestCase
  setup do
    @distance_record = distance_records(:one)
  end

  test "visiting the index" do
    visit distance_records_url
    assert_selector "h1", text: "Distance Records"
  end

  test "creating a Distance record" do
    visit distance_records_url
    click_on "New Distance Record"

    fill_in "Distance in between", with: @distance_record.distance_in_between
    fill_in "Final point", with: @distance_record.final_point
    fill_in "Initial point", with: @distance_record.initial_point
    click_on "Create Distance record"

    assert_text "Distance record was successfully created"
    click_on "Back"
  end

  test "updating a Distance record" do
    visit distance_records_url
    click_on "Edit", match: :first

    fill_in "Distance in between", with: @distance_record.distance_in_between
    fill_in "Final point", with: @distance_record.final_point
    fill_in "Initial point", with: @distance_record.initial_point
    click_on "Update Distance record"

    assert_text "Distance record was successfully updated"
    click_on "Back"
  end

  test "destroying a Distance record" do
    visit distance_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Distance record was successfully destroyed"
  end
end
