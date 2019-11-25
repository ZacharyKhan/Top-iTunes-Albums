//
//  APIHandler.swift
//  Top Albums
//
//  Created by Zachary Khan on 11/25/19.
//  Copyright © 2019 Zachary Khan. All rights reserved.
//

import UIKit

public class APIHandler: NSObject {
    
    fileprivate static let albumURLString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
    public static var albums : [Album] = []
    
    static func updateData(completion: @escaping (Bool) -> ()) {
        guard let url = URL(string: albumURLString) else { return }
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url) {data, response, error in
                guard let data = data else { return }
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
                    guard let feed : NSDictionary = json["feed"] as? NSDictionary, let results : [NSDictionary] = feed["results"] as? [NSDictionary] else { return }
                    DispatchQueue.main.async {
                        parseJSON(results: results)
                        completion(true)
                    }
                } catch {
                    DispatchQueue.main.async {
                        print(error)
                        completion(true)
                    }
                }
            }.resume()
        }
    }
    
    fileprivate static func parseJSON(results: [NSDictionary]) {
        APIHandler.albums.removeAll()
        for json in results {
            let album = Album(json: json)
            APIHandler.albums.append(album)
        }
    }
}
