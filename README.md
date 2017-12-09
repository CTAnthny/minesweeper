## Introduction

Recreation of [Minesweeper][minesweeper] in Ruby!

![Minesweeper](https://s3.amazonaws.com/hal-assets.launchacademy.com/minesweeper/minesweeper.png)

### Description

A version of [Minesweeper](http://en.wikipedia.org/wiki/Minesweeper_(video_game)).

The [gosu](http://www.libgosu.org/) library is used to handle the graphics and user input within the `Minesweeper` class.

* `minesweeper.rb` contains the code which interacts with the gosu library, handles drawing the minefield on the screen, and facilitates user interaction. You do not need to alter this code.
* `minefield.rb` handles the state of the game.
* `cell.rb` handles the state of each cell in the minefield.

### Requirements

* Ruby
* Gosu

To install the `gosu` gem, simply run the following commands:

* [Gosu Documentation](https://github.com/gosu/gosu/wiki/Ruby-Tutorial)

```no-highlight
$ gem install gosu
```

### Instructions

* `git clone` this repo
* `cd` into the directory (default `ruby-minesweeper`)
* `ruby lib/minesweeper.rb`
