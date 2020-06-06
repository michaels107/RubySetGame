# Project 2
### Game of Set

### Roles
* Overall Project Manager: Caroline Wheeler
* Coding Manager: Duytan Tran
* Testing Manager: Sean Michaels  
* Documentation: Reema Gupta

### Contributions
* Cards class base_deck & play_deck generation (cards.rb), Visualized subclass that appends "colorized" ASCII characters to the end of each card in base_deck & play_deck (cards.rb), Rspec testing on base_deck & playdeck generation for both Cards and Visualized (cards_spec.rb), and input-validation/setless-card-dealing systems testing (systems_testing.txt): Duytan Tran
  
* setCount, putCard method and code for removing valid set(cardsGame.rb), Timer(cardsGame.rb), rspec testing on put_cards(test_put_card_spec.rb), timer input & valid set system testing (systems_testing.txt) : Reema Gupta
* Main game functionality, plus some methods: Sean Michaels
* isSet?, same_or_dif?, tutorial + 8 helper methods (cardsGame.rb), and allSets (cards.rb) : Caroline Wheeler

### How to execute
1. Install colorize gem using terminal command: gem install colorize
2. Use the terminal command: "cd INSERTDIRECTORYNAME" to move into the "../Project-2-Quaranteam" directory
3. Use the terminal command: "ls" to verify that you are in the right location (You should see cardsGame.rb)
4. Execute the Game of Set by using terminal command: ruby cardsGame.rb

### How to resize font if you are having trouble seeing symbols
1. Execute the game as detailed above
2. Right click on the terminal
3. Click on preferences
4. Click on 'Unnamed' underneath Profiles
5. Check the box next to Custom Font
6. Click on Monospace Regular
7. Drag the slider on the bottom of the window to change text size (16 should be fine)
8. Resize the terminal window to better fit your screen by clicking and dragging on one of the window's edges

### How to run Rspec test cases
1. install rspec using terminal command: gem install rspec
2. Use the terminal command: "cd INSERTDIRECTORYNAME" to move into the "../Project-2-Quaranteam/Testing" directory
3. Use the terminal command: "ls" to verify that your are in the right location (You should see various INSERTNAME_spec.rb files)
4. Run Rspec test cases using terminal command: rspec INSERTNAME_spec.rb
