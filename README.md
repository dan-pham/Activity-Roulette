# Random-Activity-Generator
This repository contains the Random Activity Generator app. This app connects to the Bored API to query and return activities. 

## Overview
When the user opens the app, the user is presented with ten buttons on the search tab. Each button will send a different query to the Bored API. When the user taps on a button, the user will be presented with a view of a random activity in the category that was tapped. On this view, the category name and activity description can be seen. The user can choose to exit the activity or save the activity, which will add the activity into a runtime array.

<img src="/Screenshots/searchVC.png" width="250"> <img src="/Screenshots/activityView.png" width="250">

When the user presses the favorites tab, the user will be presented with all of the activities saved for that session. Here the user can delete activities, and the table will update to match the new list of data.

<img src="/Screenshots/favoritesVC.png" width="250"> <img src="/Screenshots/deleteActivity.png" width="250"> <img src="/Screenshots/deletedActivity.png" width="250">
