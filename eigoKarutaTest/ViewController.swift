//
//  ViewController.swift
//  eigoKarutaTest
//
//  Created by Jarod Trebas on 9/21/16.
//  Copyright © 2016 Jarod Trebas. All rights reserved.
//

import UIKit
import GameplayKit
import AVFoundation

class ViewController: UIViewController {
    
    var images = ["1", "2", "3", "4"]
    
    var sounds = ["1", "2", "3", "4"]
    
    var soundsSet = [String]()
    
    var imagesSet = [String]()
    
    var readCard: AVAudioPlayer!
    
    var soundCount = 0
    
    var soundValue = String()
    var box1Value = String()
    var box2Value = String()
    var box3Value = String()
    var box4Value = String()
    
    var correct = false
    
    var imageValue = String()
    
    var readyToClick = false
    
    @IBOutlet weak var playAgainButton: UIButton!

    
    @IBOutlet weak var read: UIButton!
    
    
    @IBOutlet weak var box1: UIButton!

    @IBOutlet weak var box2: UIButton!
    
    @IBOutlet weak var box3: UIButton!
    
    @IBOutlet weak var box4: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restart(_ sender: AnyObject) {
        assignAndShuffle()
    }
    
    @IBAction func playAgainButtonAction(_ sender: AnyObject) {
        
        assignAndShuffle()
        
    }
    
    @IBAction func readAction(_ sender: AnyObject) {
        if soundCount < 4 {
        let path = Bundle.main.path(forResource: "\(soundsSet[soundCount]).m4a", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            readCard = sound
            sound.play()
            readyToClick = true
        } catch {
            // couldn't load file :(
        }
          soundValue = soundsSet[soundCount]

        } else {
        }
        
        
    }
    @IBAction func box1Act(_ sender: AnyObject) {
        if box1Value == soundValue && readyToClick == true {
            checkIfCorrect(boxName:box1)
        }
    }
    @IBAction func box2Act(_ sender: AnyObject) {
        if box2Value == soundValue && readyToClick == true {
            checkIfCorrect(boxName:box2)
        }
    }
    @IBAction func box3Act(_ sender: AnyObject) {
        if box3Value == soundValue && readyToClick == true {
            checkIfCorrect(boxName:box3)
        }
    }
    @IBAction func box4Act(_ sender: AnyObject) {
        if box4Value == soundValue && readyToClick == true {
            checkIfCorrect(boxName:box4)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // assignAndShuffle()
    }
    
    func checkIfCorrect(boxName:UIButton) {
        
        boxName.isHidden = true
        imageValue = soundValue
        soundCount += 1
        readyToClick = false
        if soundCount == 4 {
            
            self.playAgainButton.setTitle("You did it! Play Again?", for: .normal)
            restartButton.isHidden = true
            playAgainButton.isHidden = false

            }
        

    }
    
    func assignAndShuffle () {
        
        soundCount = 0
        
        playAgainButton.isHidden = true
        restartButton.isHidden = false
        box1.isHidden = false
        box2.isHidden = false
        box3.isHidden = false
        box4.isHidden = false
        
        // shuffles images array
        let imagesShuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: images)
        imagesSet = imagesShuffled as! [String]
        // shuffles sounds array
        let soundsShuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: sounds)
        soundsSet = soundsShuffled as! [String]

        
        //assigns image to box and a value
        box1.setImage(UIImage(named: "\(imagesShuffled[0]).png"), for: .normal)
        box1Value = "\(imagesShuffled[0])"
        box2.setImage(UIImage(named: "\(imagesShuffled[1]).png"), for: .normal)
        box2Value = "\(imagesShuffled[1])"
        box3.setImage(UIImage(named: "\(imagesShuffled[2]).png"), for: .normal)
        box3Value = "\(imagesShuffled[2])"
        box4.setImage(UIImage(named: "\(imagesShuffled[3]).png"), for: .normal)
        box4Value = "\(imagesShuffled[3])"
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

