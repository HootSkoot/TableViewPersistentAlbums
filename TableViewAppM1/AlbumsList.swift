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
        ["Title" : "Thriller", "Artist" : "Michael Jackson", "Year" : "1982", "Label" : "Epic", "Art" : UIImage(named: "Michael_Jackson_-_Thriller")!,
         "Songs": ["1. Wanna be startin something 6:02", "2. Baby be mine 4:20", "3. The Girl is Mine 3:41", "4. Thriller 5:57", "5. Beat it 4:18", "6. Billie Jean 4:54", "7. Human Nature 4:07",
                   "8. P.Y.T. 4:59", "The Lady in My Life 4:59"]],
        ["Title" : "FFVII Remake OST", "Artist" : "Square Enix", "Year" : "2020", "Label" : "Square Enix", "Art" : UIImage(named: "ff7r")!, "Songs": ["1. Those who fight further 3:50", "2. One Winged Angel 11:20"]],
        ["Title" : "The Bodyguard", "Artist" : "Whitney Houston", "Year" : "1992", "Label" : "BMG", "Art" : UIImage(named: "Bodyguard")!, "Songs":["1. I will always love you 4:35"]],
        ["Title" : "Purple Rain", "Artist" : "Prince", "Year" : "1984", "Label" : "Warner", "Art" : UIImage(named: "purplerain")!, "Songs": ["1. Purple Rain 8:41", "2. Let's go crazy 4:39"]],
        ["Title" : "Rumors", "Artist" : "Fleetwood Mac", "Year" : "1977", "Label" : "Warner", "Art" : UIImage(named: "rumors")!, "Songs": ["1. Go your own way 3:43", "2. The Chain 4:30"]],
        ["Title" : "Hotel California", "Artist" : "Eagles", "Year" : "1976", "Label" : "Asylum", "Art" : UIImage(named: "Hotel cal")!, "Songs": ["1. Hotel California 6:30", "2. Life in the fast lane 4:46"]],
        ["Title" : "Chromatica", "Artist" : "Lady Gaga", "Year" : "2020", "Label" : "Interscope", "Art" : UIImage(named: "chromatica")!, "Songs": ["1. Rain on me 3:02", "2. Sour Candy 2:37", "3. Sine from Above 4:04"]],
        ["Title" : "Lemonade", "Artist" : "Beyonce", "Year" : "2016", "Label" : "Parkwood", "Art" : UIImage(named: "Lemonade")!, "Songs": ["1. Hold Up 3:41", "2. Pray you catch me 3:15"]],
        ["Title" : "21", "Artist" : "Adele", "Year" : "2011", "Label" : "Columbia", "Art" : UIImage(named: "21")!, "Songs": ["1. Rolling in the deep 3:49", "2. Rumor has it 3:43"]],
        ["Title" : "Supernatural", "Artist" : "Santana", "Year" : "1999", "Label" : "Arista", "Art" : UIImage(named: "supernatural")!, "Songs": ["1. Smooth 4:56", "2. Maria Maria 4:21"]]
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
    
    func removeAlbum(index: Int) {
        
            albums.remove(at: index)
    }
    func addAlbum(new: Dictionary<String,AnyObject>) {
        albums.append(new)
    }
    func replaceAlbum(index: Int, new: Dictionary<String,AnyObject>) {
        albums[index] = new
    }
    /* func removeAlbum(index: Int) {
        if let index = favorites.index(of: fontName) {
            albums.remove(at: index)
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
