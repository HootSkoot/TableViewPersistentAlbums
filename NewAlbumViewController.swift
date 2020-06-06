//
//  NewAlbumViewController.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/6/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit

class NewAlbumViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    var albumData: AlbumsList!
    private var songList: [String] = []
    private var newTitle: String!
    private var newArtist: String!
    private var newYear: String!
    private var newLabel: String!
    var newAlbum: Dictionary<String, AnyObject>!
    var editingAlbum = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if editingAlbum == true {
            albumField.text = newAlbum["Title"] as? String
            artistField.text = newAlbum["Artist"] as? String
            yearField.text = newAlbum["Year"] as? String
            recordField.text = newAlbum["Label"] as? String
            coverField.image = newAlbum["Art"] as? UIImage
            songList = newAlbum["Songs"] as! [String]
            navigationItem.title = "Editing " + (newAlbum["Title"] as! String)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func labelEntry(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func addPressed(_ sender: UIButton) {
        songList.append(songField.text!)
        songField.text = ""
    }
    
    @IBOutlet weak var albumField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    @IBOutlet weak var recordField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var songField: UITextField!
    @IBOutlet weak var coverField: UIImageView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        
        
        newAlbum = ["Title": albumField.text!, "Artist": artistField.text!, "Year": yearField.text!, "Label": recordField.text!, "Art": coverField.image!, "Songs": songList] as Dictionary<String, AnyObject>
        //albumData.addAlbum(new: newAlbum as Dictionary<String, AnyObject>)
    }

}
