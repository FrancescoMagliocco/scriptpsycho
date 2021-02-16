# ScriptPsycho
I've been working on this mod for a while now, and have been wanting to create a dedicated repository for it for a while now; I've just been procrastinating.  This README is going to be far from finished, but I will try to update it as much as I can when I have time and am not working on the mod.

Any Commands listed here, in order to run them in the console, you **MUST** execute the following command in the console first:
`SP = GetMod("scriptpsycho")`

**TODO** Reword better^

## Features
ScriptPsycho is full of features that are not only fully customziabile, but also have some features that are really pointless, but decided to add them because I'm sure someone will like the ability to fully customize everything.

<sup>I'm aware there are a lot of spelling mistakes, but they aren't my priority at the moment.  There is a lot that needs to be documanted before I even consider going througbh all of that.</sup>

### AutoCmds
AutoCmds are very simple: They execute a bunch of commands that either set the stat of the Player once they died and come back to life.

#### Default AutoCmds
There are a small set of AutoCmds that run when the player has spawned.  Don't worry, they all have the option to be disabled.

##### autoSetCarryCapacity
This may seem very pontless as you can easilty set the **CarryCapacity** of the Player via `Game.ModStatPlayer("CarryCapacity", 1000)`.  The only problem of this is that once you die or if you close the game, that stat is not remembered.  It goes back to what it was before it was modified.

* **autoSetCarryCapacity** true
* **carryCapacity** 1000
* `SP.Player.UpdateCarryCapacity(capacity)`  This will change the default of **carryCapacity**

###### TODO
* Add function to disable/enable **autoSetCarryCapacity** wihtout the need to edit the config file

##### autoReduceFallDmg
The Mechanics in this game are stupid!  If you change the speed of your player and walk off of a walk, you will probably get hurt.  Now with this option, you are not invinvible to to fall damage.  If you start to *greyout*..  You're still screwed.

* **autoReduceFallDmg** true
* `SP.Player.ReduceFallDMg()

###### TODO
* Add function to change default without needing to modify the config file

##### autoWalk
This is **NOT** an **AUTO WALKER**.  All this does is set the *"MaxSpeed"* of the player to a speficied speed.

* **autoWalk** true
* **walkSpeed** 9
* `SP.Player.UpdateWalkSpeed(speed)`  This will change the default of **walkSpeed**
* `SP.Player.Walk()`  Sets the *"MaxSpeed"* of player to **walkSpeed**

###### TODO
* Add function to disable/enable **autoWalk** without the need to edit the config file

##### autoStats
**THIS IS GOING TO HAVE TO BE DOCUMENTED WAY BETTER!**

* **autoStatsEnabled** true
* **autoStats** `{}`  If you want to auto set a stat, the format is `{"statName", value}`.  Example: `{ "MaxSpeed", 100)`  In the config file, **autoStats** in this case would show as follows: `{{"MaxSpeed", 100}}` *The double braces are **NOT** a typo*

###### TODO
* Add function to disable/endable **autoStatsEnabled** without the need to edit the config file.
* Add function to add, remove entry for **autoStats**
* Add function to modify `value` of a particular `statName` in **autoStats**

##### autoCmdsEnabled
Now there is an optoin to disable/enable **JUST** the previous features.  Without the name of **autoCmdsEnabled** it shouuld relate to **ALL** commands, but it doesn't.  I'll explain more later.

* **autoCmdsEnabled** true

###### TODO
* Add function to enable/disable **autoCmdsEnable**

##### runSpeed
When moving around, I like to be really fast!

* **runSpeed** 40
* `SP.Player.UpdateRunSpeed(speed)`  Changed the default of **runSpeed**
* `SP.Player.Run()`

##### autoWalkInCombat
Lets say you're running, though it may be easy to get around, what happens if you enter combat?  It is rather hard to shoot and do much of anything when you're moving incredibly fast.  To fix that, this option was created.  Bscailly all it does is when you enter combat and are running *(The mod can determiune whether or not you're running)^, `Player.Walk()` is executed.  Now I know there is no `SP.` prefixed on this command, but that is because the mod internally doesn't need you to run `SP = GetMod("scriptpsycho")` for it to work.  That is only needed if you want to run any caommands from the conosle.

* **autoWalkInCombat** true

###### TODO
* Add function to disable/ednable **autoWalkInCombat**

##### autoRunAfterOutCombat
You can probably guess what this one is for.  If you were running before you entered combat; once you exit combat, Player will have their *"MaxSpeed"* set back to **runSpeed**

* **autoRunAfterOutCombat** true

###### TODO
* Add function to enable/disable **autoWalkAfterOutCombat**
* Change to allow this to be only enabled if **autoWalkInCombat** is enabled

##### autoRefillLowAmmo
This will **NOT** auto refill your magazine!  Have you ever been in combat and run out of ammo, and because you're in combat, you can't craft more ammo?  I have, but lukily I had a different gun.  It was a crappy gun though.  

There are multiple optoins for this, but I will have to update that later.

* **autoRefillLowAmmo** true

###### TODO
* Document other optoins there is for this
* Add function to disable/enable **autoRefillLowAmmo**
* Add functions to change not documented optoins

##### modEnabled
This setting affects just the automatic features of this mod, even though it should affect the whole mod its self.

* **modEnabled** true

###### TODO
* Add function to enabled/disable **modEnabled**
* Probably change **modEnabled** to affect whole mod instead of just the automatic functions.

##### TODO
* Document all functions
