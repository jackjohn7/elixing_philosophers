defmodule ElixingPhilosophersTest do
  use ExUnit.Case
  doctest ElixingPhilosophers

  test "greets the world" do
    assert ElixingPhilosophers.hello() == :world
  end
end
