//
//  ErrorAlert.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

// Alert that handles errors sent from the AlbumService.
extension UIViewController {
    func errorAlert(error: AlbumError) {
        // Switch based on the type of error and create an alert accordingly that is written in user-friendly terms.
        switch error {
        case AlbumError.unableToCreateURLError:
            showAlert(title: "Invalid URL Error", message: "Unable to create a valid URL. Please go to rss.itunes.apple.com to generate a valid RSS Feed URL.", dismiss: false)
        
        case AlbumError.unableToConnectToITunesError:
            showAlert(title: "iTunes Connection Error", message: "Unable to connect to iTunes. Please check if you have an Internet connection.", dismiss: false)
        
        case AlbumError.noDataResponseError:
            self.showAlert(title: "No Data Response Error", message: "Unable to retrieve data from iTunes. Please try again later.", dismiss: false)
        
        case AlbumError.invalidJsonDataError:
            self.showAlert(title: "Invalid Data Error", message: "Unable to translate data from iTunes. Data may be blank or in different format.", dismiss: false)
        }
    }
    
    func showAlert(title: String, message: String, dismiss: Bool) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        
        if dismiss == false {
            // Just present the alert.
            self.present(alertController, animated: true, completion: nil)
        } else {
            // Dismiss the view controller since this is presented on the album detail view controller.
            self.present(alertController, animated: true, completion: {
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
}
