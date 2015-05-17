//
//  WikiViewController.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/17/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var wikiWebView: UIWebView!
    @IBOutlet weak var wikiActivityIndicator: UIActivityIndicatorView!
    var canLoad : Bool
    var model : StarWarsCharacter
    
    init(aModel : StarWarsCharacter){
        
        model = aModel
        canLoad = true
        super.init(nibName: "WikiViewController", bundle: nil)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var nc = NSNotificationCenter.defaultCenter()
        nc.addObserver(self, selector: "notifyThatCharacterDidChange:", name: "characterDidChange", object: nil)
        self.syncWithModel()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.wikiWebView.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
    //Mark:  UIWebViewDelegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.wikiActivityIndicator.stopAnimating()
        self.wikiActivityIndicator.hidden = true
        self.canLoad = false
    }
    
    //To avoid loading another page
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return self.canLoad
    }
    
    
    //Mark: Notifications
    func notifyThatCharacterDidChange(notification : NSNotification){
        
        let valueFromDict:Dictionary<String,StarWarsCharacter!> = notification.userInfo as! Dictionary<String,StarWarsCharacter!>
        var character:StarWarsCharacter = valueFromDict["characterKey"]!
        self.model = character
        self.syncWithModel()
    }
    

    //Mark: Helper funtions
    func syncWithModel(){
        
        self.canLoad = true
        self.wikiActivityIndicator.hidden = false
        self.wikiActivityIndicator.startAnimating()

        var wikiURL = NSURL(string: self.model.wikiURL)
        self.wikiWebView.loadRequest(NSURLRequest(URL: wikiURL!))
    
    }
    
    
}
