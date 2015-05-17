//
//  CharacterViewController.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/16/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    
    @IBOutlet weak var characterImage: UIImageView!
    
    
    var aModel : StarWarsCharacter!
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, model: StarWarsCharacter) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        self.aModel = model
        self.syncWithModel()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.syncWithModel()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    @IBAction func wikiButton(sender: AnyObject) {
    }
 
    @IBAction func playButton(sender: AnyObject) {
    }
    
    
    //MARK: auxiliary methods
    func syncWithModel(){
        
        self.title = self.aModel.alias
        self.characterImage.image = self.aModel.imagen
    }
    
    
}
