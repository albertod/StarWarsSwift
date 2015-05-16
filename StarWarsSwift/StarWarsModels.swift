//
//  StarWarsModels.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/16/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class StarWarsCharacter {
    
    var nombre  : String?
    var alias   : String?
    var imagen  : UIImage?
    var sonido  : AVAudioPlayer?
    var wikiURL : String?
    
}

class StarsWarsUniverse{
    
    var rebelsArray = [StarWarsCharacter]()
    var imperialsArray = [StarWarsCharacter] ()
}
