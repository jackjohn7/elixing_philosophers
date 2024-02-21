defmodule ElixingPhilosophers do
  def main do
    children = [
      {Mutex, name: MyMutex}
    ]
{:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)

    phils = 10
    apetite = 5
    chopsticks = Enum.to_list(0..phils-1)
    IO.puts chopsticks
    IO.puts "10 Philosophers are dining!"
    spawner(phils-1, phils-1, apetite, chopsticks)
  end

  def spawner(phils, max_phils, apetite, chopsticks) do
    # spawn one them call spawner again
    left_idx = if phils == 0 do 
      max_phils
    else
      phils-1
    end
    right_idx = phils
    # odd philosophers grab chopsticks in opposite order
    if rem(phils, 2) == 0 do
      spawn(fn -> dine(phils,
        apetite, chopsticks, left_idx, right_idx) end)
    else
      spawn(fn -> dine(phils,
        apetite, chopsticks, right_idx, left_idx) end)
    end
    if phils > 0 do
      spawner(phils - 1, max_phils, apetite, chopsticks)
    end
  end

  def dine(id, apetite, chopsticks, first_idx, second_idx) do
    IO.puts "Philosopher #{id} is thinking (apetite = #{apetite})"
    lock = Mutex.await_all(MyMutex, [
      Enum.at(chopsticks,first_idx),
      Enum.at(chopsticks, second_idx)])
    IO.puts "Philosopher #{id} is eating"
    :timer.sleep(30 + :rand.uniform(40) * 10)
    Mutex.release(MyMutex, lock)
    if apetite > 0 do
      dine(id, apetite - 1, chopsticks, first_idx, second_idx)
    else
      IO.puts "Philosopher #{id} is full"
    end
  end
end
