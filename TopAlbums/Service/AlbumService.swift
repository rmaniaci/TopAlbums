//
//  AlbumService.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

// A protocol that is implemented by the AlbumServiceImpl class.
protocol AlbumService {
    func registerDelegate(delegate: AlbumDelegate)
    
    func fetchAlbums()
}
