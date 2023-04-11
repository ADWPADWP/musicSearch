//
//  struct.swift
//  Musicsearch
//
//  Created by Park Vladislav on 09.01.2023.
//

import Foundation
import SwiftyJSON
struct Song {
    var artistName = ""
    var trackName = ""
    var previewUrl = ""
    var artworkUrl100 = ""
    
    init() {
        
    }
    init(json: JSON) {
        if let item = json["artistName"].string {
            artistName = item
        }
        if let item = json["trackName"].string {
            trackName = item
        }
        if let item = json["previewUrl"].string {
            previewUrl = item
        }
        if let item = json["artworkUrl100"].string {
            artworkUrl100 = item
        }
    }
}
