//
//  ViewController.swift
//  Project2
//
//  Created by Dmitry Nikitenko on 8.04.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreTitle: UILabel!
    @IBOutlet var scoreValue: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var step: Float = -0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreTitle.text = "Your score is:"
        
        countries += ["estonia", "france","germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        settingButtonView(button1)
        settingButtonView(button2)
        settingButtonView(button3)
        
        askQuestion()
    }
    
    func initGame(action: UIAlertAction! = nil) {
         score = 0
         correctAnswer = 0
         step = -0.1
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        scoreValue.text = String(score)
        step += 0.1
        progressBar.progress = step
        
        title = countries[correctAnswer].uppercased()
        
        if step == 1.0 {
            let ac = UIAlertController(title: "Game over", message: "Your score is: \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "New Game!", style: .default, handler: initGame))
            
            present(ac, animated: true)
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
            askQuestion()
        } else {
            score -= 1
            
            let ac = UIAlertController(title: "Wrong", message: "It was \(countries[correctAnswer].capitalized)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
    }
    
    
    func settingButtonView(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

