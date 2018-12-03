//
//  ITunesRSSFeedHandler.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

class ITunesRSSFeedHandler : ITunesRSSFeedDelegate {
    static let shared = ITunesRSSFeedHandler()
    
    func fetchAlbumsFromITunesRSSFeed(completion: @escaping ([Result]?, AlbumError?) -> Void) {
        // Check if the provided URL is valid.
        guard let url = URL(string: AlbumConstants.urlString) else {
            completion(nil, AlbumError.unableToCreateURLError)
            return
        }
        // Make a REST GET call to the iTunes RSS Feed with the given URL and session.
        let urlRequest = URLRequest(url: url)
        let task = AlbumConstants.session.dataTask(with: urlRequest) { data, response, error in
            // Alert user when unable to connect to server.
            guard error == nil else {
                print(error!)
                completion(nil, AlbumError.unableToConnectToITunesError)
                return
            }
            
            // Make sure that the call returned data.
            guard let responseData = data else {
                print("Error: did not receive data")
                completion(nil, AlbumError.noDataResponseError)
                return
            }
            
            // Use JSONDecoder to parse and map JSON provided by the RSS Feed into the Album model.
            do {
                let jsonDecoder = JSONDecoder()
                
                // Album implements the Codable protocol.
                let album = try jsonDecoder.decode(Album.self, from: responseData)
                
                // Check if the results are valid.
                guard let results = album.feed?.results else {
                    print("error trying to convert data to JSON")
                    completion(nil, AlbumError.invalidJsonDataError)
                    return
                }
                
                completion(results, nil)
            } catch let jsonError {
                // JSON was unable to be decoded, which means that the JSON was blank or changed.
                print(jsonError)
                completion(nil, AlbumError.invalidJsonDataError)
                return
            }
        }
        task.resume()
    }
    
    func fetchImageFromArtworkURL(url: URL, completion: @escaping (UIImage) -> Void) {
        // The default session configuration is constant.
        let urlRequest = URLRequest(url: url)
        let task = AlbumConstants.session.dataTask(with: urlRequest) { data, response, error in
            // Unable to connect to server.
            guard error == nil else {
                // When fetching images, no alerts are displayed to the user because there could be multiple album artwork images with errors in the Top Albums View Controller.
                // Conversely there could be multiple cells without any errors.
                // In the Album Detail View Controller, the album artwork image fetching could have an error but the rest of the data may be correct based on the JSON parsing and mapping results.
                print(error!)
                return
            }
            
            // Make sure that the call returned data.
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            // Check if the data can be converted to an image.
            if let downloadedImage = UIImage(data: responseData) {
                // Only return the image view when the url of the downloaded image matches that of the request.
                completion(downloadedImage)
            } else {
                print("Error trying to convert data to image")
            }
        }
        task.resume()
    }
}
