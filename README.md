## Introduction

Recreation of [Minesweeper](http://en.wikipedia.org/wiki/Minesweeper_(video_game)) in Ruby!

![Minesweeper](https://s3.amazonaws.com/hal-assets.launchacademy.com/minesweeper/minesweeper.png)

### Description

The [gosu](http://www.libgosu.org/) library is used to handle the graphics and user input within the `Minesweeper` class.

* `minesweeper.rb` contains the code which interacts with the gosu library, handles drawing the minefield on the screen, and facilitates user interaction.
* `minefield.rb` handles the state of the game.
* `cell.rb` handles the state of each cell in the minefield.

### Requirements

* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Gosu](http://www.libgosu.org/)
* Command line access

To install the `gosu` gem, simply run:

```no-highlight
$ gem install gosu
```
If your system does not have the gem dependencies you will receive an error and need to update accordingly:
* [Gosu Documentation - OS X](https://github.com/gosu/gosu/wiki/Getting-Started-on-OS-X)
* [Gosu Documentation - Windows](https://github.com/gosu/gosu/wiki/Getting-Started-on-Windows)
* [Gosu Documentation - Linux](https://github.com/gosu/gosu/wiki/Getting-Started-on-Linux)

### Instructions

* `git clone` this repo
* `cd` into the directory (default `ruby-minesweeper`)
* `ruby lib/minesweeper.rb`
