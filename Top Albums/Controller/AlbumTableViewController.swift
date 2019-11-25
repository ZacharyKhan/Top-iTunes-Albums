//
//  AlbumTableViewController.swift
//  Top Albums
//
//  Created by Zachary Khan on 11/24/19.
//  Copyright © 2019 Zachary Khan. All rights reserved.
//

import UIKit

class AlbumTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate lazy var albumTableView : UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .nikeWhite
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "albumCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewController()
        setupAutoLayoutViews()
    }

    fileprivate func setupViewController() {
        view.backgroundColor = .nikeWhite
        APIHandler.updateData(completion: { (success) -> Void in
            self.albumTableView.reloadData()
        })
    }
    
    fileprivate func setupAutoLayoutViews() {
        
        view.addSubview(albumTableView)
        self.albumTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.albumTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.albumTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.albumTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

    // MARK: UITableView Delegate & Datasource Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return APIHandler.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
        cell.album = APIHandler.albums[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlbumTableViewCell, let album = cell.album else { return }
        let detailVC = AlbumDetailViewController()
        detailVC.album = album
        self.show(detailVC, sender: self)
    }
}
