//
//  ViewController.swift
//  ChitChaT
//
//  Created by Disha Limbani on 2024-01-23.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var RegisterBtn: UIButton!
    @IBOutlet weak var LoginBtn: UIButton!
    
    var lbl = K.appName
    var index = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in lbl {
            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false) { timer in
                self.TitleLabel.text?.append(i)
            }
           
            index += 1
        }
        // Do any additional setup after loading the view.
    }


}

