//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let eggTimes = ["Soft":3,"Medium":4,"Hard":7]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        let hardness = sender.currentTitle!
        secondsPassed = 0
        totalTime = eggTimes[hardness]!
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        
        
    }
    @objc func updateTimer() {
        if (secondsPassed < totalTime) {
            secondsPassed += 1
            progressBar.progress=Float(secondsPassed)/Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
}
