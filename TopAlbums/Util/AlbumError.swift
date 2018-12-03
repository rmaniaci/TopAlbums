//
//  AlbumError.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import Foundation

// Enum consisting of self-explanatory errors that occur throughout the app.
enum AlbumError : Error {
    case unableToCreateURLError
    case unableToConnectToITunesError
    case noDataResponseError
    case invalidJsonDataError
}
