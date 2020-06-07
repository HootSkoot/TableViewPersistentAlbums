//
//  RootTableViewController.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/4/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    
    private static let cellTableIdentifier = "AlbumName"
    private var albums: AlbumsList!
    var newAlbum: Dictionary<String, AnyObject>!
    private var editingIndexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        albums = AlbumsList()
        navigationItem.rightBarButtonItem = editButtonItem
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
        
        //Get album detal for cells
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.cellTableIdentifier, for: indexPath)
        let rowData = albums.getAlbum(index: indexPath.row)
        cell.textLabel?.text = rowData["Title"]! as? String
        cell.detailTextLabel?.text = rowData["Artist"]! as? String
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
            
            listVC.selectedAlbum = albums.getAlbum(index: indexPath.row)
            listVC.navigationItem.title = albums.getAlbum(index: indexPath.row)["Title"] as? String
        } else {
            //let new view know its in edit mode, and send existing album
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let listVC = segue.destination as! NewAlbumViewController
            listVC.editingAlbum = true
            editingIndexPath = indexPath
            listVC.newAlbum = albums.getAlbum(index: indexPath.row)	
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
                albums.replaceAlbum(index: editingIndexPath.row, new: sourceViewController.newAlbum)
                tableView.reloadRows(at: [editingIndexPath], with: .none)
                sourceViewController.editingAlbum = false
            } else {
                let newAlbum = sourceViewController.newAlbum
                let newIndexPath = IndexPath(row: albums.getCount(), section: 0)
                albums.addAlbum(new: newAlbum!)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            // Delete the row from the data source
            albums.removeAlbum(index: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath],
                                 with: UITableViewRowAnimation.fade)
        }
        
    }


}
