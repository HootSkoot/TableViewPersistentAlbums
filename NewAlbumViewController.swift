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
    var newAlbum = Album(title: "", artist: "", year: "", label: "", art: nil, songs: [])
    var editingAlbum = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumField.delegate = self
        artistField.delegate = self
        yearField.delegate = self
        recordField.delegate = self
        songField.delegate = self
        if editingAlbum == true {
            albumField.text = newAlbum?.title
            artistField.text = newAlbum?.artist
            yearField.text = newAlbum?.year
            recordField.text = newAlbum?.label
            coverField.image = newAlbum?.art
            songList = (newAlbum?.songs)!
            navigationItem.title = "Editing " + (newAlbum?.title)!
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
        
        
        
        newAlbum = Album(title: albumField.text!, artist: artistField.text!, year: yearField.text!, label: recordField.text!, art: coverField.image!, songs: songList)
        //albumData.addAlbum(new: newAlbum as Dictionary<String, AnyObject>)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
	
}
