//
//  ViewController.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. Released under the terms of the MIT license.
//

import UIKit
import React

class ViewController: UIViewController {
                            
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func startGameButtonTapped(_ sender : UIButton) {
    let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
    self.present(game, animated: true, completion: nil)
  }
    
  @IBAction func highScoreButtonTapped(sender : UIButton) {
    NSLog("Hello")
    var ip : String = "";
    if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
        let dictRoot = NSDictionary(contentsOfFile: path)
        if let dict = dictRoot {
            NSLog(dict["IPADDRESS"] as! String)
            ip = (dict["IPADDRESS"] as! String);
        }
    }
    
    let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
    let mockData:NSDictionary = ["ipAddress":
        [
            ["ip":ip]
        ]
    ]

    let rootView = RCTRootView(
        bundleURL: jsCodeLocation,
        moduleName: "ReactNativeIOS",
        initialProperties: mockData as [NSObject : AnyObject],
        launchOptions: nil
    )
    let vc = UIViewController()
    vc.view = rootView
    self.present(vc, animated: true, completion: nil)
  }
}

