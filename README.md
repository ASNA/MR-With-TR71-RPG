##Using IBM i's TR 7.1 full free format ILE RPG with ASNA Mobile RPG

This example shows how to use Mobile RPG's (MR) DDSList control to display a navigable list. The DDSList control provides a commong mobile idiom that lists data and lets users make selections from that list. It also shows how to navigate from one panel to another and how to use the DDSGMap control to display a google map. 

Most of all, though, this MR app is an exercise in using IBM i's Tech Refresh 7.1 full freeformat ILE RPG. I am quite impressed with how much better RPG can be when written using the full freeformat (shouldn't we just call it the FFF syntax?).   

>The RPG code for this project is in the RPG folder.  

> [Read more details about this program](https://asna.com/us/articles/newsletter/2015/q2/ile-rpg-goes-free)
 
The DDSList populated with data is shown below. The DDSList provides two selection "zones"; The red zone (the left 80% of so of a row) and the blue zone (the right 20% or so of the row).  

![](http://i.imgur.com/TxtBT84.png)

<small>Figure 1a. The main list panel</small>

Tapping any row's red zone in the DDSList shows the update panel shown in Figure 1b.  

![](http://i.imgur.com/dxyNiWQ.png)

<small>Figure 1b. </small>

Tapping any row's blue zone in the DDSList shows the map panel shown in Figure 1c.  

![](http://i.imgur.com/F7crAd8.png)

<small>Figure 1c. </small>