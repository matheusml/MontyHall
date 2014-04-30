defmodule MontyHall do
  use Application.Behaviour

  @moduledoc """
  A simulator of the Monty Hall Problem, http://en.wikipedia.org/wiki/Monty_Hall_problem
	In this case, the contestant always changes the door, so we expected a win rate of 2/3.
  """

  def run(0), do: []
  def run(times), do: do_run(times)

  defp do_run(times) do 
  	door_picked = randomize_door
  	IO.puts "Contestant picks door number #{door_picked}"
  	door_with_prize = randomize_door
  	IO.puts "The prize is in door number #{door_with_prize}"

  	do_print_if_contestant_won(door_picked, door_with_prize)
  	
  	run(times - 1)
  end

  defp do_print_if_contestant_won(door_picked, door_with_prize) do 
  	if door_picked !== door_with_prize do
  		IO.puts "The contestant changed the door and won!"
  	else
  		IO.puts "The contestant changed the door but lost!"
  	end
  end

  def randomize_door, do: do_randomize_door

  defp do_randomize_door do
  	:random.seed(:erlang.now)
    :random.uniform(3)
  end

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    MontyHall.Supervisor.start_link
  end
end
