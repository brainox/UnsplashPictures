# UnsplashPictures
UnsplashPictures is a photo gallery app

![Simulator Screen Shot - iPhone 12 Pro - 2021-12-21 at 11 11 19](https://user-images.githubusercontent.com/12437059/146912615-53a6e083-c296-4a26-94b1-eb9d5d35674b.png)


## Problem 
The task was to build a simple app that allows viewing and interacting with a grid of curated photos from Unsplash.

## Solution
I built the app by utilizing UICollectionView Compositional Layout. It's a new Apple API for building complex layouts usually not possible using UICollectionViewFlowLayout. 
The grid supports pagination, i.e you can scroll on the grid of photos infinitely. 
Images are easily cached using SDWebImage framework to effectively save device resources. 

## Technologies Used

* [Swift](https://developer.apple.com/swift/) - Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, iPadOS, macOS, watchOS, tvOS, Linux, and z/OS
* RESTful API - A RESTful API is an architectural style for an application program interface (API) that uses HTTP requests to access and use data.
* [SDWebImage](https://github.com/SDWebImage/SDWebImager) - This library provides an async image downloader with cache support.

## Architecture
The architecture used is MVC (Model View Controller).

### Installation

Clone the repository
```sh
$ git clone https://github.com/brainox/UnsplashPictures.git
```

Download the Dependencies
```sh
$ cd UnsplashPictures
$ pod install
```

Open the file `UnsplashPictures.xcworkspace` with XCode

Click on the play button at the to left corner to run the app
