//
//  Album.swift
//  Top Albums
//
//  Created by Zachary Khan on 11/25/19.
//  Copyright © 2019 Zachary Khan. All rights reserved.
//

import UIKit

public struct Album {
    
    let name : String
    let artist : String
    let url : String
    let artworkURL : String
    let id : String
    let copyright : String
    let genre : String
    let releaseDate : String
    
    init(json: NSDictionary) {
        name = json["name"] as? String ?? "Unavailable"
        artist = json["artistName"] as? String ?? "Unavailable"
        artworkURL = json["artworkUrl100"] as? String ?? "Unavailable"
        url = json["url"] as? String ?? "Unavailable"
        id = json["id"] as? String ?? "Unavailable"
        copyright = json["copyright"] as? String ?? "Unavailable"
        releaseDate = json["releaseDate"] as? String ?? "Unavailable"
            
        guard let genres : NSDictionary = (json["genres"] as? [NSDictionary])?.first, let genre : String = genres["name"] as? String else { self.genre = "Unavailable"; return }
        self.genre = genre
    }
    
}
