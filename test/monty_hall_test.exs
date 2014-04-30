defmodule MontyHallTest do
  use ExUnit.Case

  test "returns a random door number, between 1 and 3" do
  	door_with_prize = MontyHall.randomize_door
  	assert door_with_prize <= 3
  	assert door_with_prize >= 1
  end

  test "stops to run when recursion is ended" do
  	assert MontyHall.run(0) == []
  end

  test "runs correctly" do
  	assert MontyHall.run(10) == []
  end
end
