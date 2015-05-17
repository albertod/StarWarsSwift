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

class CharacterViewController: UIViewController,UISplitViewControllerDelegate,StarWarsUniverseViewControllerDelegate {

    
    @IBOutlet weak var characterImage: UIImageView?
    
    
    var model : StarWarsCharacter
    //Player have to be declaraed as a global variable
    var player = AVAudioPlayer()
    
    init(aModel: StarWarsCharacter){
        model = aModel
        super.init(nibName:"CharacterViewController", bundle: nil)
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
        
        var wikiVC = WikiViewController(aModel: self.model)
        self.navigationController?.pushViewController(wikiVC, animated: false)
    }
 
    @IBAction func playButton(sender: AnyObject) {
        
        
        var path = NSBundle.mainBundle().pathForAuxiliaryExecutable(model.sonido)
        var URLFile = NSURL(fileURLWithPath: path!)
        player = AVAudioPlayer(contentsOfURL: URLFile, error: nil)
        player.prepareToPlay()
        player.play()
    }    
    
    //MARK: SplitViewDelegate
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        
        if displayMode == UISplitViewControllerDisplayMode.AllVisible{
            //the table is hidden
            //Put the buttom for navigation
            self.navigationItem.leftBarButtonItem = nil;
            
        }else{
            //We are in landScape, so all it is visible, and hide the buttom
            self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem();
        }
    }
    
    //MARK: auxiliary methods
    func syncWithModel(){
        
        self.title = self.model.alias
        self.characterImage?.image = self.model.imagen
    }
    
    //Mark: protocol
    func starWarsViewController(_swvc: StarWarsUniverseTableViewController, didSelectCharacter: StarWarsCharacter) {
        
        self.model = didSelectCharacter
        self.syncWithModel()
    }
    
}
