//
//  ViewController.swift
//  Bull’s Eye game
//
//  Created by mac on 4/14/20.
//  Copyright © 2020 ASD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue : Int = 50
    var targetValue : Int = 0
    var difference = 0

    var score : Int = 0
    var round : Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
            currentValue = lround(Double(slider.value))
            targetValue = Int.random(in: 1...100)
            targetLable.text = String(targetValue)
            scoreLabel.text = String(score)
            roundLabel.text = String(round)
            startNewGame()

    }

    @IBAction func showAlert(_ sender: Any)
    {

        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let title: String
        if difference == 0 {title = "Perfect!"}
        else if difference < 5 {title = "You almost had it!"}
        else if difference < 10 {title = "Pretty good!"}
        else {title = "Not even close..."}
        
        
        let message = "your score is: \(points) Points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            _ in self.startNewRound()
        })
    
        alert.addAction(action)
        
        present(alert , animated: true, completion: nil)
        round += 1

      //  startNewRound()
        
    }
    @IBAction func sliderMoved(_ sender: Any)
    {
        currentValue = lround(Double(slider.value))
    }
    
    func startNewRound()
    {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels()
    {

        targetLable.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    @IBAction func startNewGame(_ sender: Any)
    {
        score = 0
        round = 0
        startNewRound()
    }
    func startNewGame()
    {
        score = 0
        round = 0
        startNewRound()
    }
}


