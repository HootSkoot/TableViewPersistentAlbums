//
//  NewAlbumViewController.swift
//  TableViewAppM1
//
//  Created by user156499 on 6/6/20.
//  Copyright © 2020 MZN0047. All rights reserved.
//

import UIKit

class NewAlbumViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    private var songList: [String] = []
    var newAlbum: Dictionary<String, AnyObject>!
    var editingAlbum = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumField.delegate = self
        artistField.delegate = self
        yearField.delegate = self
        recordField.delegate = self
        songField.delegate = self
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
    
    @IBOutlet  var albumField: UITextField!
    @IBOutlet  var yearField: UITextField!
    @IBOutlet  var artistField: UITextField!
    @IBOutlet  var recordField: UITextField!
    @IBOutlet  var addButton: UIButton!
    @IBOutlet  var songField: UITextField!
    @IBOutlet  var coverField: UIImageView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    

    // MARK: - Navigation

 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        
        
        newAlbum = ["Title": albumField.text!, "Artist": artistField.text!, "Year": yearField.text!, "Label": recordField.text!, "Art": coverField.image!, "Songs": songList] as Dictionary<String, AnyObject>
        //albumData.addAlbum(new: newAlbum as Dictionary<String, AnyObject>)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
	
}
