require 'test_helper'

class DistanceRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @distance_record = distance_records(:one)
  end

  test "should get index" do
    get distance_records_url
    assert_response :success
  end

  test "should get new" do
    get new_distance_record_url
    assert_response :success
  end

  test "should create distance_record" do
    assert_difference('DistanceRecord.count') do
      post distance_records_url, params: { distance_record: { distance_in_between: @distance_record.distance_in_between, final_point: @distance_record.final_point, initial_point: @distance_record.initial_point } }
    end

    assert_redirected_to distance_record_url(DistanceRecord.last)
  end

  test "should show distance_record" do
    get distance_record_url(@distance_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_distance_record_url(@distance_record)
    assert_response :success
  end

  test "should update distance_record" do
    patch distance_record_url(@distance_record), params: { distance_record: { distance_in_between: @distance_record.distance_in_between, final_point: @distance_record.final_point, initial_point: @distance_record.initial_point } }
    assert_redirected_to distance_record_url(@distance_record)
  end

  test "should destroy distance_record" do
    assert_difference('DistanceRecord.count', -1) do
      delete distance_record_url(@distance_record)
    end

    assert_redirected_to distance_records_url
  end
end
