//
//  CharacterViewController.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/16/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class CharacterViewController: UIViewController {

    
    @IBOutlet weak var characterImage: UIImageView!
    
    
    var model : StarWarsCharacter
    //Player have to be declaraed as a global variable
    var player = AVAudioPlayer()
    
    init(aModel: StarWarsCharacter){
        model = aModel
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = self.splitViewController?.displayModeButtonItem()
        
        self.syncWithModel()
        
    }
    
    @IBAction func wikiButton(sender: AnyObject) {
    }
 
    @IBAction func playButton(sender: AnyObject) {
        
        var path = NSBundle.mainBundle().pathForAuxiliaryExecutable(model.sonido!)
        var URLFile = NSURL(fileURLWithPath: path!)
        
        player = AVAudioPlayer(contentsOfURL: URLFile, error: nil)
        player.prepareToPlay()
        player.play()
    }
    
    
    //MARK: auxiliary methods
    func syncWithModel(){
        
        self.title = self.model.alias
        self.characterImage.image = self.model.imagen
    }
    
    
}
