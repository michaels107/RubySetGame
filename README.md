# Project 2
### Game of Set

### Roles
* Overall Project Manager: Caroline Wheeler
* Coding Manager: Duytan Tran
* Testing Manager: Sean Michaels  
* Documentation: Reema Gupta

### Contributions
* base_deck formation, play_deck formation, and respective print methods for cards class (cards.rb), Visualized subclass of Cards
  that appends respective colorized ASCII characters to the end of each card, rspec testing (cards_spec.rb): Duytan Tran
* setCount, putCard method and code for removing valid set(cardsGame.rb), Timer(timer.rb): Reema Gupta
* Main game functionality, plus some methods: Sean Michaels

### How to execute
1. Install colorize gem using terminal command: gem install colorize
2. cd to the file location of cardsGame.rb
3. Execute Game of Set by using terminal command: ruby cardsGame.rb

### How to run Cards & Visualized Class test cases
1. install rspec using terminal command: gem install rspec
2. cd to the file location of cards_spec.rb
3. Run cards_spec.rb test cases using terminal command: rspec cards_spec.rb
Note: require 'cards' wouldn't allow use to run cards_spec.rb within the testing folder, hence it is on the same level as cards.rb using require_relative 'cards', the filename for which it is testing
