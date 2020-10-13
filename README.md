# bowling-kata-ruby

My attempt at the bowling kata in Ruby.

The kata is described [here](https://learn.madetech.com/katas/bowling/).

Note that this may have been registered with RubyGems.org as the `csud-bowl-kata` Gem (or not - haven't actually done that yet).

# How to run the app

Start by running `bundle install`. After that, there are two ways of using this app:

1. Enter the inputs as a command line param, like this: 
```bash
./src/bowling_cli.rb -r 'X X 5/ 4/ X X 8/ 1/ X X -5'
```

2. Pipe in the input, like this: 
```bash
echo 'X X 5/ 4/ X X 8/ 1/ X X -5' | ./src/bowling_cli.rb
```

3. Run the code with no params, then you will be prompted to enter the text on the command line. Like this:
```bash
./src/bowling_cli.rb
# Then enter this on the command line afterwards:
X X 5/ 4/ X X 8/ 1/ X X -5
```