//
//  ViewController.swift
//  BullsEye
//
//  Created by Daniel Cohen on 09/11/2017.
//  Copyright © 2017 Daniel Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreGoal: UILabel!
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentValue = Int(slider.value)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")  // UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")  // UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")  // UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")  // UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    func updateLabels(){
        scoreGoal.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value)
        print("The value of the slider is now:\(currentValue) ")
    }

    
    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(currentValue-targetValue)
        var points = 100 - difference
        
        
        let title: String
        if difference == 0 {
            title = "Perfect! Double points!"
            points += 100
        }else if difference == 1 {
            title = "So close! Extra points!"
            points += 50
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "pretty good"
        } else if difference < 30 {
            title = "Not even close"
        } else {
            title = "Are you drunk?"
        }
        
        score += points

        
        let message = "You scored \(points) points. \n(You hit \(currentValue), bull's eye is at \(targetValue))"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
                self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        

    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }

    
}

