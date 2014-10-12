//
//  ViewController.swift
//  99Luftballons
//
//  Created by Dan Manteufel on 10/11/14.
//  Copyright (c) 2014 ManDevil Programming. All rights reserved.
//

import UIKit

//MARK: Controller

class ViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var luftballonImageView: UIImageView!
    @IBOutlet weak var luftballonNumberLabel: UILabel!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    //MARK: Run Sequence and Supporting Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLuftballons()
        displayLuftballon()
    }

    func displayLuftballon() {
        luftballonNumberLabel.text = "\(luftballons.last!.orderNumber)"
        luftballonImageView.image = UIImage(named: luftballons.last!.randomImageName)
    }
    
    //MARK: IBActions
    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        if luftballons.count > 1 {
            luftballons.removeLast()
            displayLuftballon()
        } else {
            luftballonNumberLabel.font = UIFont.systemFontOfSize(48.0)
            luftballonNumberLabel.text = "All Gone!"
            nextButton.enabled = false
            nextButton.title = "Done"
            luftballonImageView.image = UIImage(named: "BerlinTVTower.jpg")
        }
    }
    
}

//MARK: - Model

//MARK: Defines
let numberOfLuftballons = 99

//MARK: Globals
var luftballons: [Luftballon] = []
var currentIndex = 4

//MARK: Structs
struct Luftballon {
    let orderNumber: Int
    let randomImageName: String
}

//MARK: Functions
func createLuftballons() {
    for counter in 1...numberOfLuftballons {
        luftballons.append(Luftballon(orderNumber: counter,randomImageName: assignRandomImage()))
    }
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


