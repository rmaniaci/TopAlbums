//
//  AlbumServiceImpl.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

class AlbumServiceImpl : AlbumService {
    var delegate: AlbumDelegate?
    static let shared = AlbumServiceImpl()
    
    func registerDelegate(delegate: AlbumDelegate) {
        self.delegate = delegate
    }
    
    func fetchAlbums() {
        // Make the RSS Feed call.
        ITunesRSSFeedHandler.shared.fetchAlbumsFromITunesRSSFeed(completion: { (results: [Result]?, error: AlbumError?) -> Void in
            
            if error == nil {
                // Go ahead and call the delegate.
                self.delegate?.handleFetchAlbums(results: results!)
            } else {
                // There was an error so it needs to be handled.
                self.delegate?.handleFetchAlbumsError(error: error!)
            }
        })
    }
}
