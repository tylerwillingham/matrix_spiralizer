# MatrixSpiralizer

MatrixSpiralizer takes a matrix (or two-dimensional array) input and returns a
string determined by spiraling through the contents of the array. The spiral pattern
reads the top row, the right column, the bottom row (in reverse order) and then the left
column upward. It will also downcase the entire result string.

For example, the following matrix:

```
A B C D
E F G H
I J K L
M N O P
```

represented as a 2-dimensional array:

```ruby
[
 ['A', 'B', 'C', 'D'],
 ['E', 'F', 'G', 'H'],
 ['I', 'J', 'K', 'L'],
 ['M', 'N', 'O', 'P'],
]
```

Will return:

```
"a b c d h l p o n m i e f g k j"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'matrix_spiralizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install matrix_spiralizer

## Usage

To use MatrixSpiralizer, simply create a new instance, pass your desired input
and then fire the `#read` method on that instance.

```ruby
brilliant_input = [
 ['A', 'B', 'C', 'D'],
 ['E', 'F', 'G', 'H'],
 ['I', 'J', 'K', 'L'],
 ['M', 'N', 'O', 'P'],
]

spiralizer = MatrixSpiralizer.new(brilliant_input)
results = spiralizer.read
# => "a b c d h l p o n m i e f g k j"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
