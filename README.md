# MyMoods

Thank you for checking out MyMoods! Here is some important info on how to get started if you'd like to test the app and/or contribute to development!

# Development Environment 

## IDE
 - Xcode 14 - ideal for iOS development given its built in iOS simulators for efficient testing. (You'll need a device running macOS)

# Cloning repository

On our [repository](https://gitlab.cci.drexel.edu/fds23/65/team-15/mood-tracker/-/tree/master), click the blue **Clone** button and copy the **Clone with HTTPS** link.

Inside of your command line, create a directory with a name of your choosing and **cd** into it. Example:  `mkdir myDirectory`,`cd myDirectory`

Next run the command `git clone `

If you want to use GitLab CI with your own MacOS runners (a requirement since we
do not currently yet offer shared MacOS runners - follow [infrastructure#5294](https://gitlab.com/gitlab-com/gl-infra/infrastructure/issues/5294) for
updates on that front) please read through the blog post above which will walk 
you through everything you need to get up and running.

## What's contained in this project

This template contains a simple Food Tracker App based off of the [Start Developing iOS Apps (Swift) Lessons](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html). Where necessary the template has been upgraded to use Swift 4. The app displays a list of meals consisting of a name, rating, and photo. Users are able to add or edit a meal by navigating to a detail screen. The app also includes a lightweight solution for basic data persistence.
