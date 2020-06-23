//
//  Album.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/22/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//
import UIKit
import Foundation

class Album : NSObject, NSCoding {
    var title:String
    var artist:String
    var year:String
    var label:String
    var art:UIImage?
    var songs:Array<String>?
    
    init?(title:String,artist:String,year:String,label:String,art:UIImage?,songs:Array<String>?) {
        if title.isEmpty { return nil }
        self.title = title
        self.artist=artist
        self.year=year
        self.label=label
        self.art=art
        self.songs=songs
    }
    
    struct PropertyKey {
        static let title = "Title"
        static let artist = "Artist"
        static let year = "Year"
        static let label = "Label"
        static let art = "Art"
        static let songs = "Songs"
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(artist, forKey: PropertyKey.artist)
        aCoder.encode(year, forKey: PropertyKey.year)
        aCoder.encode(label, forKey: PropertyKey.label)
        aCoder.encode(art, forKey: PropertyKey.art)
        aCoder.encode(songs, forKey: PropertyKey.songs)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: PropertyKey.title) as? String
        let artist = aDecoder.decodeObject(forKey: PropertyKey.artist) as? String
        let year = aDecoder.decodeObject(forKey: PropertyKey.year) as? String
        let label = aDecoder.decodeObject(forKey: PropertyKey.label) as? String
        let art = aDecoder.decodeObject(forKey: PropertyKey.art) as? UIImage
        let songs = aDecoder.decodeObject(forKey: PropertyKey.songs) as? Array<String>
        self.init(title:title!, artist:artist!, year:year!, label:label!, art:art, songs:songs)
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("albums")
    
    
}
