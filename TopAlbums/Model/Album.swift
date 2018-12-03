//
//  Album.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import Foundation

// A series of structs that represents the top albums across all genres fetched from the Apple iTunes RSS Feed that conform to the Codable protocol. This allows for the simplification of JSON parsing and mapping.

// Wrapper for the Feed instance.
struct Album : Codable {
    let feed: Feed?
}

// Metadata that includes array of albums fetched from the Apple iTunes RSS feed.
struct Feed : Codable {
    let results: [Result]?
}

// Name of the album, the artist, the album art, genres, release date, copyright info, and album url to link to the album page on the iTunes store.
struct Result : Codable {
    let artistName, releaseDate, albumName, copyright, artwork: String?
    let genres: [Genre]?
    let albumUrl: String?
    
    // The CodingKeys enumeration allows for the "albumName", "artworkUrl1100", and "url" keys to be mapped to the name artwork, and url properties, respectively
    enum CodingKeys: String, CodingKey {
        case artistName, releaseDate, albumName = "name", copyright, artwork = "artworkUrl100"
        case genres
        case albumUrl = "url"
    }
}

// A struct representing an individual genre.
struct Genre : Codable {
    let name: String?
}
