require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = true
    # act
    result = robot.station
    # assert
    assert_equal(1, result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new
    robot.vintage_model = true
    robot.needs_repairs = true
    # act
    result = robot.station
    #assert
    assert_equal(2, result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    # act
    result = robot.station
    # assert
    assert_equal(3, result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new
    robot.needs_repairs = false
    # act
    result = robot.station
    # assert
    assert_equal(4, result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new
    robot.todos = []
    # act
    empty_todo_list = robot.prioritize_tasks
    # assert
    assert_equal(-1, empty_todo_list)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    robot.todos = [1, 2, 3]
    # act
    check_priority = robot.prioritize_tasks
    # assert
    assert_equal(3, check_priority)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = 'Saturday'
    # act
    check_workday = robot.workday?('Saturday')
    # assert
    assert_equal(false, check_workday)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = 'Saturday'
    # act
    check_workday = robot.workday?('Sunday')
    # assert
    assert_equal(true, check_workday)
  end

end
