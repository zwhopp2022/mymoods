# MyMoods

Thank you for checking out MyMoods! Here is some important info on how to get started if you'd like to test the app and/or contribute to development!

# Development Environment 

## IDE
 - Xcode 14 - ideal for iOS development given its built in iOS simulators for efficient testing. (You'll need a device running macOS)

# Cloning repository

On our [repository](https://gitlab.cci.drexel.edu/fds23/65/team-15/mood-tracker/-/tree/master), click the blue **Clone** button and copy the **Clone with HTTPS** link.

Inside of your command line, create a directory with a name of your choosing and **cd** into it. Example:  `mkdir myDirectory`,`cd myDirectory`

Next run the command `git clone [clone with https link from previous step]`

Now you will be able to access the MyMoods source code, create branches, and edit the code! But there's a couple more steps.

## Installing CocoaPods and SQLite

[CocoaPods](https://cocoapods.org/) is a dependency manager that MyMoods utilizes to use the [SQLite package](https://github.com/stephencelis/SQLite.swift) which allows the storage of data on a user's device. 

To install CocoaPods and SQLite, follow these steps
1. Run this command in your command line: `sudo gem install cocoapods`
2. Update the pods file that is created to the following configuration

use_frameworks!

target 'YourAppTargetName' do

    pod 'SQLite.swift', '~> 0.14.0'

end

3. Run this command in your command line: `pod install --repo-update`

This template contains a simple Food Tracker App based off of the [Start Developing iOS Apps (Swift) Lessons](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html). Where necessary the template has been upgraded to use Swift 4. The app displays a list of meals consisting of a name, rating, and photo. Users are able to add or edit a meal by navigating to a detail screen. The app also includes a lightweight solution for basic data persistence.
