//
//  AlbumConstants.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

// A struct consisting of networking constants that are used by the iTunes RSS Feed Handler class.
struct AlbumConstants {
    // Set up the URL String.
    private static let baseUrlString = "https://rss.itunes.apple.com/api/v1"
    private static let country = "us"
    private static let mediaType = "apple-music"
    private static let feedType = "top-albums"
    private static let genre = "all"
    private static let resultsLimit = "10"
    private static let allowExplicit = "explicit"
    private static let format = "json"
    static let urlString = "\(baseUrlString)/\(country)/\(mediaType)/\(feedType)/\(genre)/\(resultsLimit)/\(allowExplicit).\(format)"
    
    // Set up the session for the iTunes RSS Feed Handler to use.
    private static let config = URLSessionConfiguration.default
    static let session = URLSession(configuration: config)
}
