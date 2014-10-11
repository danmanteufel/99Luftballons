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
    
//    @IBOutlet weak var temporaryTestLabel: UILabel!
    
    var luftballons: [Balloon] = []
    var currentIndex = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
        create99Luftballons()
        displayLuftballon()
    }

    func create99Luftballons() {
        for counter in 1...99 {
            luftballons.append(Balloon(orderNumber: counter,randomImageName: assignRandomImage()))
        }
    }
    
    func displayLuftballon() {
        balloonNumberLabel.text = "\(luftballons.last!.orderNumber)"
//        temporaryTestLabel.text = luftballons.last!.randomImageName
        balloonImageView.image = UIImage(named: luftballons.last!.randomImageName)
    }
    
    func assignRandomImage() -> String {
        var randomIndex: Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(4)))
        } while currentIndex == randomIndex

        currentIndex = randomIndex
        
        switch randomIndex {
        case 0:
            return "RedBalloon1.jpg"
        case 1:
            return "RedBalloon2.jpg"
        case 2:
            return "RedBalloon3.jpg"
        case 3:
            return "RedBalloon4.jpg"
        default:
            return "BerlinTVTower.jpg"
        }
    }
    
    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        if luftballons.count > 1 {
            luftballons.removeLast()
            displayLuftballon()
        } else {
            balloonNumberLabel.font = UIFont.systemFontOfSize(48.0)
            balloonNumberLabel.text = "All Gone!"
//            temporaryTestLabel.text = "Done"
            nextButton.enabled = false
            nextButton.title = "Done"
        }
    }
    
}

struct Balloon {
    let orderNumber: Int
    let randomImageName: String
}

