//
//  AlbumDetailViewController.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/5/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    var selectedAlbum = Dictionary<String, AnyObject>()
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    navigationItem.rightBarButtonItem = editButtonItem

        albumTitleLabel.text = selectedAlbum["Title"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
