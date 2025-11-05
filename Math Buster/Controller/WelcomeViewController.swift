//
//  WelcomeViewController.swift
//  Math Buster
//
//  Created by Nadira Seitkazy  on 04.11.2025.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserScore()
    }
    
    func getUserScore() {
        let userDefaults = UserDefaults.standard
        guard let userScore = userDefaults.array(forKey: ViewController.userScoreKey) else {
            print("UserDefaults doesn't contain array with key: \(ViewController.userScoreKey)")
            return
        }
        guard let userScoreArrayOfDictionary = userScore as? [[String: Any]] else {
            print("Couldn't covert Any to [[String:Any]]")
            return
        }
        
        print("userScoreArrayOfDictionary: \(userScoreArrayOfDictionary)")
    }

}
