//
//  AlbumTableViewCell.swift
//  Top Albums
//
//  Created by Zachary Khan on 11/25/19.
//  Copyright © 2019 Zachary Khan. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    var album : Album? {
        didSet {
            parseAlbumData(album: self.album)
        }
    }
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "TITLE"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artistLabel : UILabel = {
        let label = UILabel()
        label.text = "ARTIST"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .purple
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupCell() {
        backgroundColor = .white
        
        addSubview(albumImageView)
        albumImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        albumImageView.widthAnchor.constraint(equalTo: heightAnchor, constant: -32).isActive = true
        albumImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -32).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -2).isActive = true
        
        addSubview(artistLabel)
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        artistLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: 16).isActive = true
        artistLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        artistLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    fileprivate func parseAlbumData(album: Album?) {
        guard let album = album else { return }
        DispatchQueue.main.async {
            self.titleLabel.text = album.name
            self.artistLabel.text = album.artist
            self.albumImageView.loadImage(fromUrl: album.artworkURL)
        }
    }
    
}
