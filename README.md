## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_rr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_rr

## Usage

Using easy_rr is very easy, as its name suggests. You just need to pass it an array and an integer to specify the amount of times that each participant will face each other.

It receives two parameters: an array and an integer.

The array consists of the users, teams, or participants that will be matched.
The integer is the amount of times each participant will face each other participant. This defaults to 1.

Here's a little example:

```ruby

	#You can pass an array
	teams = [ "Colombia", "Peru", "Venezuela", "Brazil" ]

	#Then you can call EasyRr to generate the matches
	games = EasyRr.matches(teams)

	#=> [[["Venezuela", "Brazil"], ["Peru", "Colombia"]], [["Peru", "Brazil"], ["Colombia", "Venezuela"]], [["Colombia", "Brazil"], ["Venezuela", "Peru"]]] 
```

By passing a second parameter you can specify the amount of times each participant will face each other participant, as said before.

So, in another little example:

```ruby

	#The array

	teams = [ "Real Madrid", "Bayern Munchen", "Juventus", "F.C. Barcelona" ]

	#Generate the matches, this time you pass 2 as the number of times they will face each other
	games = EasyRr.matches(teams,2)

	#=> [[["Bayern Munchen", "F.C. Barcelona"], ["Juventus", "Real Madrid"]], [["Juventus", "F.C. Barcelona"], ["Real Madrid", "Bayern Munchen"]], [["Real Madrid", "F.C. Barcelona"], ["Bayern Munchen", "Juventus"]], [["Bayern Munchen", "F.C. Barcelona"], ["Juventus", "Real Madrid"]], [["Juventus", "F.C. Barcelona"], ["Real Madrid", "Bayern Munchen"]], [["Real Madrid", "F.C. Barcelona"], ["Bayern Munchen", "Juventus"]]] 
```

If you want, you can also pass an ActiveRecord object, for instance:

```ruby

	#This can be the collection of participants

	participants = Model.teams

	#As this can also be passed

	participants = User.all
```

Either way, an array of integers can also be passed if you don't have the names of each participant but the ids.

```ruby

	#Array of ids
	teams = [ 1,2,3,4 ]

	games = EasyRr.matches(teams)
	=> [[[2, 4], [3, 1]], [[3, 4], [1, 2]], [[1, 4], [2, 3]]] 
```

If the array passed is odd, the generated array will have one match where one of the teams is nil.

```ruby

	#Array of ids
	teams = [ 1,2,3,4,5 ]

	games = EasyRr.matches(teams)
	=> [[[2, nil], [3, 1], [4, 5]], [[3, nil], [4, 2], [5, 1]], [[4, nil], [5, 3], [1, 2]], [[5, nil], [1, 4], [2, 3]]] 
```

Finally, you can loop through the generated array and create each match in your database according to the model you have.

```ruby

	teams = [ "Italy", "France", "Argentina", "Ghana" ]

	teams.each do |j|
		j.map { |x| Model.create("params_here") }
	end
``` 

Enjoy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

