Pirate-Adventure
================

Pirate Adventure game from iOS 7 course on Udemy

Pirate Adventure assignment

Objective:

This project will be the most comprehensive assignment to-date. At the end of this assignment, you should have acquired a formidable understanding of each of the major concepts we’ve touched upon in our first two weeks. While it might appear intimidating at first, successful completion of the assignment should help you grasp key concepts in object-oriented programming, a foundational pillar for the rest of our class together.

Let me state emphatically that this is meant to be a challenge. But, if you break this up and solve it in chunks, this puzzle is solvable. Building something of this length will allow you to put many of the concepts we've learned so far in an appropriate context.

When approaching this project, we STRONGLY recommend working on one part at a time. As such, we have broken this assignment into multiple parts.

Furthermore, you are highly encouraged to customize your application and attempt the problems on your own before viewing the solution videos. The solutions provided do not constitute the only way to complete this assignment. If your application meets the specified requirements, then you have solved that problem. What is offered is concise and clean code that may prove to be a helpful comparison as you work through the assignment. Finally, this assignment is meant to take some time to complete. As such we will be releasing the solutions this week and next.

Project Requirements:

The application, at its heart, is a game. The application should have a coordinate system. We recommend starting with a 4 by 3 rectangular coordinate system. Users should be able to navigate to different “tiles” by pressing one of 4 directional arrows. Tiles are objects which will package the information required to update our view. When a valid movement is not possible the buttons should be inactive or hidden.

Use a Tile object to package the information. This means creating a class called Tile that will have properties that we can use to update our view ie. a story, a background etc. You can declare these properties in its' header file. Then when you create instances of your tile object you can set these properties and group information for your view together.

The game should also include a character object. It should have health, damage, weapon and armor stat. The first two properties may be integers but the last two should be a Class that you create. This means you will have to create a Armor and Weapon class. Both of these classes should have a name and damage or a health bonus where appropriate.

The view should contain at least 1 label that should display a story for our game. There should be at least 1 button that allows the user to do a specific action based on the current tile. There should also be an area to display your character’s stats including its' health amount, damage amount, weapon name and armor name.

To create the tiles, you should implement a Factory class. This sounds complex, but in reality it is pretty straight forward. The Factory class will serve as an intermediary between our models and our View Controller. We should define a method that returns an NSArray of Tile objects. Within this method we can create 12 instance of our Tile class and set properties for our tile here. While not required, it is certainly recommended that you create 4 arrays that contain 3 tile objects. We then recommend wrapping all 4 arrays into a single array and returning it from your method. This is called an embedded method and was discussed in the Pirate Adventure Prereq videos.

When users tap on the directional buttons, the application should be able to determine which tile to make active. Your application should also update the information on the view appropriately. Users should also be able to interact with the story with the action button (we included this in the actions UIView). Suggested interactions could include: picking up an additional weapon, armor or some health effect either negative or positive.

There should be only 1 character object in the application at a given time and that character should only have 1 weapon and 1 armor. Therefore, if an action changes the weapon you will have to determine how to remove the old weapon and/or armor and its’ effect before adding the new armor and weapon. This updated information should be displayed in the character stats UIVIew.

To finish the application you will need to create a Boss class. Like the character, the Boss object should have a health stat so that we know when we’ve defeated the boss. Users should be able to fight the boss on one of the tiles. Every time an action occurs that may reduce our characters health, we should check to see if our current health is 0. During the fight with the boss we should check to see if the bosses health is 0. If our boss dies before we lose all of our health, we should alert the user they have won. If we die at any point in the application we should be alerted that we lost the game.

Finally, the user should have a way to start over. Add a button to your application and title it reset. When the user presses this button reset the character’s stats to their initial values, set the starting point back to 0,0 and reload the view.

Image Assets

Download image assets

Extra Credit

We will include additional tasks for those students that want to push forward and attempt some problems on their own. These are only recommendations and are not core to our curriculum. Let me stress that these are meant to be very challenging. In many cases you will need to come up with inventive solutions or do a bit of online research. Best of luck!

Randomize tiles 2-12 so that your game is more dynamic. You always start at the same place but the location of the boss and everything else is left to chance.

Right now if a user doesn’t want to complete an action they can simply navigate to a new tile. Disable the navigation buttons for certain tiles so the user must complete an action before they can proceed. For the final boss fight lock the user in so they can not retreat until they have gotten attacked at least once by the boss.

Add additional UIAlertViews to tell a better story and make it more interactive. For example once a user picks up a sword put up an alert that says user takes sword.

Add an additional class for our character, perhaps an item class.

Do some balancing with your damage and health numbers so that it is possible for your user to lose if they take the wrong path, but also possible for them to win if they take the correct path through your game.

RECOMMENDED STEPS AND HINTS:

Part 1: Setting up the storyboard, a basic Tile object and a Factory.

Part 2: Navigating between tiles, adding a background image and upgrading the story.

Part 3: Adding additional objects: Weapon and Armor and Character: adding their effects to our project.

Part 4: Adding a actions to our story

Part 5: Final boss and Reset

Note

The recommended steps below are not the only way to solve this assignment. As much as you can try and solve the assignment based on the requirements and use this section when you get stuck or are unsure of how to proceed.

Part 1: Setting up the storyboard, a basic Tile object and a Factory

The first thing we need to do is setup our view. Setting up our view will give us an idea of where this project is headed and will hopefully get us thinking about how our viewcontroller interacts with our view.

Take a look at the assignment video for inspiration (although feel free to take some artistic liberty!). The background is a UIImageView and as a nice touch, I set my container UIView objects to be partially transparent. I set the "alpha" property on them to induce transparency. Alpha may be found in the attributes inspector and has a value between 0 and 1.

Although our tile object will eventually be used to update our entire view, we recommend you start with a basic story until you can get the tiles updating properly as you navigate on your coordinate system.

Finally, you should create your factory class. The method declaration should look something like this:

-(NSArray *)tiles;

I recommend creating 4 arrays that each have 3 tile objects. Something like this:

NSArray *column1Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];

NSArray *column2Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];

NSArray *column3Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];

NSArray *column4Array = [[NSArray alloc] initWithObjects:tile1, tile2, tile3];

Then create an array to hold each column:

NSArray *tilesArray = [[NSArray alloc] initWithObjects:column1Array, column2Array, column3Array, column4Array];

Part 2. Navigating between tiles, adding a background image and upgrading the story.

Now that we have a factory setup we should use it to create our tiles array in our view Controller. We also need to setup an initial point for our user to start at in our coordinate system. I recommend using a property for both in the CCViewController.h headerfile. This way will be able to access your current point in all methods as well as your tiles.

Don’t forget to create a CGPoint we use the syntax CGPointMake(x,y).

Each time we set a new tile as our active tile we need to hide buttons that are invalid. To do this we can use the hidden property for UIButton that will hide the button on the screen. This property can be set to a BOOL value ie. YES or NO. I recommend putting this into a method so that we can reuse this functionality throughout our application.

We should call this method in viewDidLoad so that when our initial view is setup our west and south buttons will be hidden.

We should run a test on all 4 buttons to determine if they are valid. This can be accomplished by simply taking our current point and either adding 1 to x, adding 1 to y, subtracting 1 from x or subtracting 1 from y. On this new point we have to perform 4 tests. If the point passes all 4 tests it is a valid or possible. If it fails any of them the tile does not exist. We should check to make sure that our y point is greater than or equal to 0 and that our x point is greater than or equal to 0 to confirm that our point is above our lower bounds. To test our upper bounds we should check to make sure that our x point is less than the count of our tiles array. We should also check to make sure that our y point is less than the tiles array container. We can access this tiles array through: [self.tiles objectAtIndex:point.x].

Now that you are able to dynamically hide your buttons you need to actually implement the functionality for each of your IBActions connected to the arrow buttons. If for example the user presses the north button update the current point with something like: self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);

Finally, once you have the navigation between tiles working which you should be able to confirm visually on your storyboard as your story should change from reading story 1 to story + 2-12. It’s time to update you factory. Add a background image to your tile object and make your story more explicit. Then using that information update your view.

Part 3: Adding additional objects: Weapon and Armor and Character: adding their effects to our project.

It is important to learn about creating many classes and one of your classes as a property in another class.

First create a Weapon and Armor class. The weapon class should have properties of damage and name of type int and NSString respectively. The Character class should have properties of health and name of type int and NSString respectively.

Now you can create a character class. A weapon, armor, damage and health. In order to create a property of type Weapon and Armor you will need to import both the Weapon class and Armor class into your header file, not your implementation file.

Next create an instance of character in your factory. You should setup some initial settings. Perhaps your character starts with a weapon or armor. You should give your character an initial amount of health and you can choose to give you character damage. The factory will have to import character into its’ header file. Your method might look something like this:

-(CCCharacter *)character;

Notice that we are returning a character instance from this method, hence the need to import our character class into our header file.

Finally, in your ViewController.h file create a property so you will be able to access its’ value throughout your class. Then create your character in viewDidLoad. You should finish by updating your characters information onto the view.

Part 4: Adding a actions to our story

Now that we have a character inside of our application and we can navigate through our application its’ time to add actions to our application.

Start by updating your tile. For brevity your tile’s header file should now have a story, a background image, an actionbutton title, a weapon, armor and health effect.

Now in our factory we can setup our tile to include all of these attributes. For example a tile in our factory might now look like this:

Tile *tile1 = [[Tile alloc] init];

tile1.story = @”In the stone you see a gilded sword that glimmers in the sunlight”

tile1.backgroundImage = [UIImage imageNamed:@”GlimmeringSword.jpg”];

tile1.actionButtonTitle = @”Take sword”;

Weapon *sword = [[Weapon alloc] init];

sword.name = @”Glimmer sword”;

sword.damage = 20;

tile1.weapon = sword;

Now our tile knows that its’ action is related to a specific weapon or armor or health effect. Update all your tiles so that they have an actionButtonName so that we can update our actionButton in our storyboard. Also add Armor a weapon or a health effect.

When thinking about where to implement this functionality remember that we have an IBAction called actionButtonPressed. It would make sense here to test if the current tile has either a weapon, armor or a health effect associated with it here. Using an if, else if and else statement we should be able to test which variation our tile object has. For example:


if (tile.armor != nil)

{

self.character.health = self.character.health - self.character.armor.health + tile.armor.health;

self.character.armor = tile.armor;

}

Notice that we first update our characters health by removing the old armor before adding our new armor’s health benefit. Then we update our current character’s armor to the tiles armor.

Part 5: Final boss and reset

Create a Boss class it should have a health. Depending on your implementation it may also do damage or you may include damage as a health effect as part of the boss story. Create a method in your factory that returns one boss object:

-(Boss *)boss;

As we did with our character object I would recommend only having one boss in our class. We will need to track its’ health stat for the entire life cycle of our view Controller so it would be prudent to make our boss a property. You can use your factory to setup your boss in the viewDidLoad method.

Every time you do an action you should test if your health is less than 0. Now that you have a boss you should also do an if statement to test if the bosses health is less than 0. Finally, it would be great if the user were alerted if their health falls below 0 in which case they lose or if the bosses health dips below 0 in which case they can claim victory. I would recommend using a UIAlertView:

UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];

[alertView show];

If you aren’t sure how to do this check out the video and you can see it done by hand!

