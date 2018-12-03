//
//  AlbumDetailViewController.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    var result: Result?
    
    let albumImageView : AlbumImageView = {
        let img = AlbumImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    let albumNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artistNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releaseDateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let copyrightInfoLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 17)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView : UIStackView = {
        let view = UIStackView()
        view.axis  = NSLayoutConstraint.Axis.vertical
        view.alignment = UIStackView.Alignment.fill
        view.distribution = UIStackView.Distribution.fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewInITunesButton : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 17)
        button.setTitle("View in iTunes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(viewInITunes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Top Albums"
        
        // Add views.
        self.view.addSubview(albumImageView)
        
        stackView.addArrangedSubview(albumNameLabel)
        stackView.addArrangedSubview(artistNameLabel)
        stackView.addArrangedSubview(genreLabel)
        stackView.addArrangedSubview(releaseDateLabel)
        stackView.addArrangedSubview(copyrightInfoLabel)
        self.view.addSubview(stackView)
        
        self.view.addSubview(viewInITunesButton)
        
        // Add AutoLayout constraints for each view.
        albumImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 51).isActive = true
        albumImageView.heightAnchor.constraint(equalTo: albumImageView.widthAnchor).isActive = true
        albumImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        albumImageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        albumImageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 20).isActive = true
        
        albumNameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        albumNameLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        artistNameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        artistNameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .vertical)

        genreLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        genreLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        
        releaseDateLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        releaseDateLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        
        copyrightInfoLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        copyrightInfoLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        
        viewInITunesButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewInITunesButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        viewInITunesButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewInITunesButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        viewInITunesButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        
        // Set the image and labels.
        albumImageView.fetchImage(urlString: result?.artwork ?? "")
        albumNameLabel.text = result?.albumName
        artistNameLabel.text = result?.artistName
        
        // Get the main genre.
        let genre = result?.genres
        let genreName = genre?[0]
        genreLabel.text = genreName!.name
        
        // Reformat the release date.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: (result?.releaseDate)!) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            releaseDateLabel.text = "Released \(dateFormatter.string(from: date))"
        }
        
        // Reformat the copyright if possible.
        let copyright = result?.copyright
        if let index = copyright?.range(of: ",")?.lowerBound {
            let substring = copyright?[..<index]
            copyrightInfoLabel.text = String(substring!)
        } else {
            copyrightInfoLabel.text = result?.copyright
        }
    }
    
    
    @objc func viewInITunes(sender: UIButton) {
        if let iTunesURLString = result?.albumUrl, let iTunesURL = URL(string: iTunesURLString) {
            if UIApplication.shared.canOpenURL(iTunesURL) {
                UIApplication.shared.open(iTunesURL, options: [:], completionHandler: nil)
            }
        }
    }
}
