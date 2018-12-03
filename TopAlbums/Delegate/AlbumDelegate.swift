//
//  AlbumDelegate.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import Foundation

// Delegate protocol that allows for callbacks from the AlbumService.
protocol AlbumDelegate {
    func handleFetchAlbums(results: [Result])
    
    func handleFetchAlbumsError(error: AlbumError)
}
