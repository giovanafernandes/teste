require "application_system_test_case"

class DiariesTest < ApplicationSystemTestCase
  setup do
    @diary = diaries(:one)
  end

  test "visiting the index" do
    visit diaries_url
    assert_selector "h1", text: "Diaries"
  end

  test "creating a Diary" do
    visit diaries_url
    click_on "New Diary"

    fill_in "End", with: @diary.end
    fill_in "Hr observation", with: @diary.hr_observation
    fill_in "Observation", with: @diary.observation
    fill_in "Start", with: @diary.start
    fill_in "Third observation", with: @diary.third_observation
    fill_in "Weather", with: @diary.weather_id
    fill_in "Work", with: @diary.work_id
    click_on "Create Diary"

    assert_text "Diary was successfully created"
    click_on "Back"
  end

  test "updating a Diary" do
    visit diaries_url
    click_on "Edit", match: :first

    fill_in "End", with: @diary.end
    fill_in "Hr observation", with: @diary.hr_observation
    fill_in "Observation", with: @diary.observation
    fill_in "Start", with: @diary.start
    fill_in "Third observation", with: @diary.third_observation
    fill_in "Weather", with: @diary.weather_id
    fill_in "Work", with: @diary.work_id
    click_on "Update Diary"

    assert_text "Diary was successfully updated"
    click_on "Back"
  end

  test "destroying a Diary" do
    visit diaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diary was successfully destroyed"
  end
end
