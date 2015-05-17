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
    var sonido  : String?
    var wikiURL : String?
    
    
    init(nombre : String, alias : String, imagen : UIImage?, sonido : String, wikiURL : String){
        
        self.nombre = nombre
        self.alias = alias
        self.imagen = imagen
        self.sonido = sonido
        self.wikiURL = wikiURL
    }
    
}

