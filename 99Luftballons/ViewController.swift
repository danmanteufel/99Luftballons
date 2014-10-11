//
//  ViewController.swift
//  99Luftballons
//
//  Created by Dan Manteufel on 10/11/14.
//  Copyright (c) 2014 ManDevil Programming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var balloonNumberLabel: UILabel!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    @IBOutlet weak var temporaryTestLabel: UILabel!
    
    var luftballons: [Balloon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
        create99Luftballons()
        displayLuftballon()
    }

    func create99Luftballons() {
        for counter in 1...99 {
            luftballons.append(Balloon(orderNumber: counter,randomImageName: "Test\(counter)"))
        }
    }
    
    func displayLuftballon() {
        balloonNumberLabel.text = "\(luftballons.last!.orderNumber)"
        temporaryTestLabel.text = luftballons.last!.randomImageName
    }
    
    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        if luftballons.count > 1 {
            luftballons.removeLast()
            displayLuftballon()
        } else {
            balloonNumberLabel.font = UIFont.systemFontOfSize(48.0)
            balloonNumberLabel.text = "All Gone!"
            temporaryTestLabel.text = "Done"
            nextButton.enabled = false
            nextButton.title = "Done"
        }
    }
    
}

struct Balloon {
    let orderNumber: Int
    let randomImageName: String
}

