//
//  RootTableViewController.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/4/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    
    private static let cellTableIdentifier = "AlbumName"
    private var albums: AlbumsList!

    override func viewDidLoad() {
        super.viewDidLoad()
        albums = AlbumsList()
        
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.getCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(
            withIdentifier: cellTableIdentifier, for: indexPath)
            as! AlbumTableViewCell
        
        let rowData = albums[indexPath.row]
        cell.album = rowData["Title"]! as! String
        cell.artist = rowData["Artist"]! as! String
        cell.year = rowData["Year"]! as! String
        cell.label = rowData["Label"]! as! String
        cell.artLabel.image = (rowData["Art"]! as! UIImage)
        
        return cell
 */
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.cellTableIdentifier, for: indexPath)
        let rowData = albums.getAlbum(index: indexPath.row)
        cell.textLabel?.text = rowData["Title"]! as? String
        cell.detailTextLabel?.text = rowData["Artist"]! as? String
        return cell

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let listVC = segue.destination as! AlbumDetailViewController
        
        /*if indexPath.section == 0 {*/
            // Font names list
        //let familyName = familyNames[indexPath.row]
            
            listVC.selectedAlbum = albums.getAlbum(index: indexPath.row)
            listVC.navigationItem.title = albums.getAlbum(index: indexPath.row)["Title"] as? String
            /*} else {
            // Favorites list
            listVC.fontNames = favoritesList.favorites
            listVC.navigationItem.title = "Favorites"
            listVC.showsFavorites = true
        }*/
    }


}
