//
//  RootTableViewController.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/4/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit
import os.log

class RootTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    fileprivate static let rootKey = "rootKey"
    private static let cellTableIdentifier = "AlbumName"
    private var albums: Array<Album> = []
    //var newAlbum: Dictionary<String, AnyObject>!
    private var editingIndexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        if let savedAlbums = loadAlbums() {
            albums += savedAlbums
        } else {
            loadSampleAlbums()
        }
        // Do any additional setup after loading the view, typically from a nib.
        /*let xib = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        tableView.register(xib,
                           forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 70*/

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    private func loadSampleAlbums(){
        let album1 = Album(title : "Thriller", artist : "Michael Jackson", year : "1982", label : "Epic", art : UIImage(named: "Michael_Jackson_-_Thriller")!,
        songs: ["1. Wanna be startin something 6:02", "2. Baby be mine 4:20", "3. The Girl is Mine 3:41", "4. Thriller 5:57", "5. Beat it 4:18", "6. Billie Jean 4:54", "7. Human Nature 4:07",
        "8. P.Y.T. 4:59", "The Lady in My Life 4:59"])
        let album2 = Album(title : "FFVII Remake OST", artist : "Square Enix", year : "2020", label : "Square Enix", art : UIImage(named: "ff7r")!, songs: ["1. Those who fight further 3:50", "2. One Winged Angel 11:20"])
        let album3 = Album(title : "The Bodyguard", artist : "Whitney Houston", year : "1992", label : "BMG", art : UIImage(named: "Bodyguard")!, songs:["1. I will always love you 4:35"])
        let album4 = Album(title : "Purple Rain", artist : "Prince", year : "1984", label : "Warner", art : UIImage(named: "purplerain")!, songs: ["1. Purple Rain 8:41", "2. Let's go crazy 4:39"])
        let album5 = Album(title : "Rumors", artist : "Fleetwood Mac", year : "1977", label : "Warner", art : UIImage(named: "rumors")!, songs: ["1. Go your own way 3:43", "2. The Chain 4:30"])
        let album6 = Album(title : "Hotel California", artist : "Eagles", year : "1976", label : "Asylum", art : UIImage(named: "Hotel cal")!, songs: ["1. Hotel California 6:30", "2. Life in the fast lane 4:46"])
        let album7 = Album(title : "Chromatica", artist : "Lady Gaga", year : "2020", label : "Interscope", art : UIImage(named: "chromatica")!, songs: ["1. Rain on me 3:02", "2. Sour Candy 2:37", "3. Sine from Above 4:04"])
        let album8 = Album(title : "Lemonade", artist : "Beyonce", year : "2016", label : "Parkwood", art : UIImage(named: "Lemonade")!, songs: ["1. Hold Up 3:41", "2. Pray you catch me 3:15"])
        let album9 = Album(title : "21", artist : "Adele", year : "2011", label : "Columbia", art : UIImage(named: "21")!, songs: ["1. Rolling in the deep 3:49", "2. Rumor has it 3:43"])
        let album10 = Album(title : "Supernatural", artist : "Santana", year : "1999", label : "Arista", art : UIImage(named: "supernatural")!, songs: ["1. Smooth 4:56", "2. Maria Maria 4:21"])
        
        albums += [album1,album2,album3,album4,album5,album6,album7,album8,album9,album10] as! Array<Album>
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(
            withIdentifier: cellTableIdentifier, for: indexPath)
            as! AlbumTableViewCell
        
        let rowData = albums[indexPath.row]
        cell.album = rowData[title]! as! String
        cell.artist = rowData[artist]! as! String
        cell.year = rowData[year]! as! String
        cell.label = rowData[label]! as! String
        cell.artLabel.image = (rowData[art]! as! UIImage)
        
        return cell
 */
        
        //Get album detal for cells
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.cellTableIdentifier, for: indexPath)
        let rowData = albums[indexPath.row]
        cell.textLabel?.text = rowData.title
        cell.detailTextLabel?.text = rowData.artist
        return cell

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        //checking segue types
        if segue.identifier == "AddAlbum" {
            //send existing album data to add new album
            //let listVC = segue.destination as! UINavigationController
            //let childVC = listVC.topViewController as! NewAlbumViewController
            
            
        } else if segue.identifier == "ShowAlbum" {
            //checking whether segue is an edit or showing detail
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let listVC = segue.destination as! AlbumDetailViewController
            
            listVC.selectedAlbum = albums[indexPath.row]
            listVC.navigationItem.title = albums[indexPath.row].title
        } else {
            //let new view know its in edit mode, and send existing album
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let listVC = segue.destination as! NewAlbumViewController
            listVC.editingAlbum = true
            editingIndexPath = indexPath
            listVC.newAlbum = albums[indexPath.row]
        }
            /*} else {
            // Favorites list
            listVC.fontNames = favoritesList.favorites
            listVC.navigationItem.title = "Favorites"
            listVC.showsFavorites = true
        }*/
    }
    
    @IBAction func unwindFromAdd(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NewAlbumViewController
        //let sourceViewController = sender.source as! NewAlbumViewController
        //newAlbum = sourceViewController.newAlbum
        {
            if sourceViewController.editingAlbum == true {
                albums[editingIndexPath.row] = sourceViewController.newAlbum!
                tableView.reloadRows(at: [editingIndexPath], with: .none)
                sourceViewController.editingAlbum = false
            } else {
                let newAlbum = sourceViewController.newAlbum
                let newIndexPath = IndexPath(row: albums.count, section: 0)
                albums.append(newAlbum!)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveAlbums()
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Delete the row from the data source
            albums.remove(at: indexPath.row)
            saveAlbums()
            
            
            tableView.deleteRows(at: [indexPath],
                                 with: UITableViewRowAnimation.fade)
        }
        
    }
    
    func dataFileURL() -> NSURL {
        let urls = FileManager.default.urls(for:
            .documentDirectory, in: .userDomainMask)
        var url:NSURL?
        url = URL(fileURLWithPath: "") as NSURL?      // create a blank path
        url = urls.first?.appendingPathComponent("data.archive") as NSURL?
        return url!
    }
    
    private func saveAlbums(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(albums, toFile: Album.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Album Successfuly Saved", log: OSLog.default, type:.debug)
        } else {
            os_log("failed to save", log: OSLog.default, type: .error)
        }
    }
    
    private func loadAlbums() -> [Album]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Album.ArchiveURL.path) as? [Album]
    }


}
