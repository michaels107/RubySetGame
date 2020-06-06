# Project 2
### Game of Set

### Roles
* Overall Project Manager: Caroline Wheeler
* Coding Manager: Duytan Tran
* Testing Manager: Sean Michaels  
* Documentation: Reema Gupta

### Contributions
* base_deck formation, play_deck formation, and respective print methods for cards class (cards.rb), Visualized subclass of Cards that appends respective colorized ASCII characters to the end of each card, rspec testing (cards_spec.rb), systems testing (systems_testing.txt): Duytan Tran
* setCount, putCard method and code for removing valid set(cardsGame.rb), Timer(timer.rb): Reema Gupta
* Main game functionality, plus some methods: Sean Michaels
* isSet?, same_or_dif?, tutorial + 8 helper methods (cardsGame.rb), and allSets (cards.rb) : Caroline Wheeler

### How to execute
1. Install colorize gem using terminal command: gem install colorize
2. cd to the file location of cardsGame.rb
3. Execute Game of Set by using terminal command: ruby cardsGame.rb

### How to resize font if you are having trouble seeing symbols
1. Execute the game as detailed above
2. Right click on the terminal
3. Click on preferences
4. Click on 'Unnamed' underneath Profiles
5. Check the box next to Custom Font
6. Click on Monospace Regular
7. Drag the slider on the bottom of the window to the change size (16 should be fine)
8. Resize the terminal window to better fit your screen by clicking and dragging the edges of it

### How to run Rspec test cases
1. install rspec using terminal command: gem install rspec
2. cd to the file location of INSERTNAME_spec.rb in the testing folder
3. Run Rspec test cases using terminal command: rspec INSERTNAME_spec.rb
