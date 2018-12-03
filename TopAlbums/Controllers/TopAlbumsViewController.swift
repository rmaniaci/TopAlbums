//
//  TopAlbumsViewController.swift
//  TopAlbums
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import UIKit

class TopAlbumsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var results = [Result]()
    var albumService: AlbumService!
    
    let topAlbumsTableView = UITableView()
    
    private func initService() {
        // Initialize the AlbumService class and the AlbumDelegate protocol.
        albumService = AlbumServiceImpl.shared
        albumService.registerDelegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Top Albums"
        
        // Add the table view programatically.
        view.addSubview(topAlbumsTableView)
        
        // Register the Album Cell.
        topAlbumsTableView.register(AlbumCell.self, forCellReuseIdentifier: "AlbumCell")
        
        // Set up AutoLayout constraints.
        topAlbumsTableView.translatesAutoresizingMaskIntoConstraints = false
        topAlbumsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topAlbumsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        topAlbumsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topAlbumsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // Set the table view data source and the table view delegate.
        topAlbumsTableView.dataSource = self
        topAlbumsTableView.delegate = self
        
        // Initialize the AlbumService in preparation for calling fetchAlbums()
        initService()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // If the results have not been fetched, fetch them here.
        // The reason for using viewDidAppear(_:) is because the loading alert cannot be presented in viewDidLoad() because the view has not yet appeared.
        if results.count == 0 {
            // Add an alert with a loading indicator to let the user know that the albums are being fetched.
            let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.style = UIActivityIndicatorView.Style.gray
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            
            albumService.fetchAlbums()
        }
    }
    
    // MARK:- Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Initially there will be zero albums.
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Populate the AlbumCell custom table view cells.
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        cell.configure(result: results[indexPath.row])
        return cell
    }
    
    // MARK:- Table View Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Go to the album detail view controller.
        let result = results[indexPath.row]
        
        // Set the album in the Album Detail View Controller to that of the selected cell.
        let albumDetailViewController = AlbumDetailViewController()
        albumDetailViewController.result = result
        
        // Deselect the selected table view cell with this UITableViewDelegate method.
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Present the Album Detail view Controller
        navigationController?.pushViewController(albumDetailViewController, animated: true)
    }
}

// Implement the AlbumDelegate protocol.
extension TopAlbumsViewController : AlbumDelegate {
    func handleFetchAlbums(results: [Result]) {
        // Switch back the main thread, set the results property to the fetched results, and reload table view.
        DispatchQueue.main.async { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            self?.results = results
            self?.topAlbumsTableView.reloadData()
        }
    }
    
    func handleFetchAlbumsError(error: AlbumError) {
        // Switch back to the main thread and handle the error by presenting it in an alert.
        DispatchQueue.main.async { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            self?.errorAlert(error: error)
        }
    }
}
