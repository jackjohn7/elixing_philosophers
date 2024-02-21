# Elixing Philosophers

Elixir implementation of Dining philosophers problem solution.
This is the first Elixir code I've ever written, so expect it to
kinda suck.

The scheduler seems to favor certain processes over others.
The ones spawned first seem to finish first most of the time.
This isn't perfect but it does seem to accomplish the basic 
task at hand.

Not a huge fan of Elixir for this type of task. I hear great things
about its concurrency model, but my imperitive-washed brain doesn't 
really enjoy this workflow. The Mutex library I found also wasn't 
very familiar. I'm just glad it worked first try. I also do not
enjoy the experience running the app. I had to run `iex -S mix` to
load the repl with the mix project preloaded and run
`ElixingPhilosophers.main` in the repl to execute the program.
