require "application_system_test_case"

class BranchesTest < ApplicationSystemTestCase
  setup do
    @branch = branches(:one)
  end

  test "visiting the index" do
    visit branches_url
    assert_selector "h1", text: "Branches"
  end

  test "creating a Branch" do
    visit branches_url
    click_on "New Branch"

    fill_in "Cnpj", with: @branch.cnpj
    check "Main" if @branch.main
    fill_in "Membership", with: @branch.membership_id
    fill_in "Name", with: @branch.name
    fill_in "Neighborhood", with: @branch.neighborhood
    fill_in "Number", with: @branch.number
    fill_in "State", with: @branch.state
    fill_in "State registration", with: @branch.state_registration
    fill_in "Street", with: @branch.street
    fill_in "Zip code", with: @branch.zip_code
    click_on "Create Branch"

    assert_text "Branch was successfully created"
    click_on "Back"
  end

  test "updating a Branch" do
    visit branches_url
    click_on "Edit", match: :first

    fill_in "Cnpj", with: @branch.cnpj
    check "Main" if @branch.main
    fill_in "Membership", with: @branch.membership_id
    fill_in "Name", with: @branch.name
    fill_in "Neighborhood", with: @branch.neighborhood
    fill_in "Number", with: @branch.number
    fill_in "State", with: @branch.state
    fill_in "State registration", with: @branch.state_registration
    fill_in "Street", with: @branch.street
    fill_in "Zip code", with: @branch.zip_code
    click_on "Update Branch"

    assert_text "Branch was successfully updated"
    click_on "Back"
  end

  test "destroying a Branch" do
    visit branches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Branch was successfully destroyed"
  end
end
