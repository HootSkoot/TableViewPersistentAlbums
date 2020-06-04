//
//  RootTableViewController.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/4/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    let cellTableIdentifier = "CellTableIdentifier"
    let albums = [
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

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let xib = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        tableView.register(xib,
                           forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 70

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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellTableIdentifier, for: indexPath)
            as! AlbumTableViewCell
        
        let rowData = albums[indexPath.row]
        cell.album = rowData["Title"]! as! String
        cell.artist = rowData["Artist"]! as! String
        cell.year = rowData["Year"]! as! String
        cell.label = rowData["Label"]! as! String
        cell.artLabel.image = (rowData["Art"]! as! UIImage)
        
        return cell
    }


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
