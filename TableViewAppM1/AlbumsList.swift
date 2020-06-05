//
//  AlbumsList.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/5/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import Foundation
import UIKit

class AlbumsList {
    private var albums = [
        ["Title" : "Thriller", "Artist" : "Michael Jackson", "Year" : "1982", "Label" : "Epic", "Art" : UIImage(named: "Michael_Jackson_-_Thriller")!],
        ["Title" : "FFVII Remake OST", "Artist" : "Square Enix", "Year" : "2020", "Label" : "Square Enix", "Art" : UIImage(named: "ff7r")!],
        ["Title" : "The Bodyguard", "Artist" : "Whitney Houston", "Year" : "1992", "Label" : "BMG", "Art" : UIImage(named: "Bodyguard")!],
        ["Title" : "Purple Rain", "Artist" : "Prince", "Year" : "1984", "Label" : "Warner", "Art" : UIImage(named: "purplerain")!],
        ["Title" : "Rumors", "Artist" : "Fleetwood Mac", "Year" : "1977", "Label" : "Warner", "Art" : UIImage(named: "rumors")!],
        ["Title" : "Hotel California", "Artist" : "Eagles", "Year" : "1976", "Label" : "Asylum", "Art" : UIImage(named: "Hotel cal")!],
        ["Title" : "Chromatica", "Artist" : "Lady Gaga", "Year" : "2020", "Label" : "Interscope", "Art" : UIImage(named: "chromatica")!],
        ["Title" : "Lemonade", "Artist" : "Beyonce", "Year" : "2016", "Label" : "Parkwood", "Art" : UIImage(named: "Lemonade")!],
        ["Title" : "21", "Artist" : "Adele", "Year" : "2011", "Label" : "Columbia", "Art" : UIImage(named: "21")!],
        ["Title" : "Supernatural", "Artist" : "Santana", "Year" : "1999", "Label" : "Arista", "Art" : UIImage(named: "supernatural")!]
    ]
    
    private var chosenIndex = 0
    
    init() {
    }
    
    func getCount() -> Int {
        return albums.count
    }
    
    func getAlbum(index: Int) -> [String : AnyObject] {
        chosenIndex = index
        return albums[index] as [String : AnyObject]
    }
    
    
   /* func removeFavorite(fontName: String) {
        if let index = favorites.index(of: fontName) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    private func saveFavorites() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavorites()
    }
    */
}
