//
//  ITunesRSSFeedDelegate.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import Foundation
import UIKit

// A delegate that the iTunes RSS Feed Handler implements.
protocol ITunesRSSFeedDelegate {
    func fetchAlbumsFromITunesRSSFeed(completion: @escaping ([Result]?, AlbumError?) -> Void)
    
    func fetchImageFromArtworkURL(url: URL, completion: @escaping(UIImage) -> Void)
}
