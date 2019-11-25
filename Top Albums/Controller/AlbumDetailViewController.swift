//
//  AlbumDetailViewController.swift
//  Top Albums
//
//  Created by Zachary Khan on 11/25/19.
//  Copyright © 2019 Zachary Khan. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    var album : Album? {
        didSet {
            parseAlbumData(album: self.album)
        }
    }
    
    fileprivate lazy var redirectButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        button.setTitle("Open in Apple Music", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(redirectButtonHandler(sender:)), for: .touchUpInside)
        return button
    }()
    
    fileprivate let albumImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    fileprivate let albumNameLabel : UILabel = {
        let label = UILabel()
        label.text = "ALBUM NAME"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let artistNameLabel : UILabel = {
        let label = UILabel()
        label.text = "ARTIST NAME"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let genreLabel : UILabel = {
        let label = UILabel()
        label.text = "GENRE"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let releaseDateLabel : UILabel = {
        let label = UILabel()
        label.text = "RELEASE DATE"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate let copyrightLabel : UILabel = {
        let label = UILabel()
        label.text = "COPYRIGHT"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    

    fileprivate func setupViewController() {
        self.view.backgroundColor = .white
        
        view.addSubview(albumImageView)
        albumImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32).isActive = true
        albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -64).isActive = true
        albumImageView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -64).isActive = true
        
        view.addSubview(albumNameLabel)
        albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 32).isActive = true
        albumNameLabel.leftAnchor.constraint(equalTo: albumImageView.leftAnchor).isActive = true
        albumNameLabel.rightAnchor.constraint(equalTo: albumImageView.rightAnchor).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(artistNameLabel)
        artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 8).isActive = true
        artistNameLabel.leftAnchor.constraint(equalTo: albumNameLabel.leftAnchor).isActive = true
        artistNameLabel.rightAnchor.constraint(equalTo: albumNameLabel.rightAnchor).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(genreLabel)
        genreLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 32).isActive = true
        genreLabel.leftAnchor.constraint(equalTo: artistNameLabel.leftAnchor).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: artistNameLabel.rightAnchor).isActive = true
        genreLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(releaseDateLabel)
        releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 8).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: genreLabel.leftAnchor).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: genreLabel.rightAnchor).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(copyrightLabel)
        copyrightLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 8).isActive = true
        copyrightLabel.leftAnchor.constraint(equalTo: releaseDateLabel.leftAnchor).isActive = true
        copyrightLabel.rightAnchor.constraint(equalTo: releaseDateLabel.rightAnchor).isActive = true
        copyrightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(redirectButton)
        redirectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redirectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        redirectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        redirectButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        redirectButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    fileprivate func parseAlbumData(album: Album?) {
        guard let album = album else { return }
        self.albumImageView.loadImage(fromUrl: album.artworkURL)
        self.albumNameLabel.text = album.name
        self.artistNameLabel.text = album.artist
        self.genreLabel.text = album.genre
        self.releaseDateLabel.text = "Released " + album.releaseDate
        self.copyrightLabel.text = album.copyright
    }
    
    @objc fileprivate func redirectButtonHandler(sender: UIButton?) {
        guard let urlString : String = self.album?.url, let url : URL = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }

}
