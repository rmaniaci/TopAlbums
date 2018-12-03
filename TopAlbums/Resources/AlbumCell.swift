//
//  AlbumCell.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    let albumImageView : AlbumImageView = {
        let img = AlbumImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    let albumNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 18)
        label.highlightedTextColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artistNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.highlightedTextColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Add the views to the table view cell.
        self.contentView.addSubview(albumImageView)
        containerView.addSubview(albumNameLabel)
        containerView.addSubview(artistNameLabel)
        self.contentView.addSubview(containerView)
        
        // Add AutoLayout constraints for each view.
        albumImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:10).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.albumImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        albumNameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: self.albumNameLabel.bottomAnchor).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        
        // Add a disc
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.orange
        self.selectedBackgroundView = backgroundView
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(result: Result) {
        // Configure the cell.
        albumImageView.fetchImage(urlString: result.artwork ?? "")
        albumNameLabel.text = result.albumName
        artistNameLabel.text = result.artistName
    }
}
