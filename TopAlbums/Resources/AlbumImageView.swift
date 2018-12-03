//
//  AlbumImageView.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

// A subclass of UIImageView that fetches and caches images from the album artwork URL.
class AlbumImageView: UIImageView {
    private var currentUrl: String?
    
    func fetchImage(urlString: String) {
        // Hold on to the provided URL.
        currentUrl = urlString
        
        // Check if the provided URL is valid.
        guard let url = URL(string: urlString) else {
            print("Unable to create a valid image URL")
            return
        }
        
        // Clear out the current image.
        self.image = nil
        
        // Check if the image has already been cached.
        if let image = imageCache.object(forKey: urlString as NSString) {
            self.image = image
            return
        }
        
        // Add an activity indicator.
        let activityIndicator = UIActivityIndicatorView(frame: self.frame)
        activityIndicator.color = .gray
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        // Make the RSS Feed call.
        ITunesRSSFeedHandler.shared.fetchImageFromArtworkURL(url: url, completion: { (image: UIImage) -> Void in
            // Always switch back to the main thread to avoid having the RSS call block the main thread.
            DispatchQueue.main.async { [weak self] in
                // Remove the activity indicator.
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
                
                // Only set the image view when the url of the downloaded image matches that of the request.
                if urlString == self?.currentUrl {
                    // Set the image.
                    self?.image = image
                }
                
                // Cache the image.
                imageCache.setObject(image, forKey: urlString as NSString)
            }
        })
    }
}
