# TopAlbums

## Synopsis

TopAlbums is a simple iPhone app that displays the top albums across all genres using the [Apple iTunes RSS Feed](https://rss.apple.com/en-us). 

The app uses AutoLayout, but it does NOT use storyboards, nibs, or any third party libraries. 

On launch, the user sees UITableView showing one album per cell. 

Each cell displays the name of the album, the artist, and the album art (thumbnail image). 

Tapping a cell pushes another view controller on the navigation stack that displays a larger image at the top of the screen and the same information that was shown on the cell, plus genre, release date, and copyright info below the image.

A button is also included on the detail view that when tapped fast app switches to the album page in the iTunes store. 

The button is centered horizontally and pinned 20 points from the bottom of the view and 20 points from the leading and trailing edges of the view. 

Unlike the master view controller, this detail view controller does NOT use a table view for layout.

## Compile and Run

This program was developed with iOS version 12.1, Xcode version 10.1, and Swift 4.1.

## License

MIT license as described in the LICENSE file.
App icon powered by LogoMakr.com.
Launch image powered by LogoMakr.com.
