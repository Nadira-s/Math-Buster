//
//  ViewController.swift
//  Math Buster
//
//  Created by Nadira Seitkazy  on 03.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var problemLabel: UILabel!
    
    @IBOutlet weak var timerControllerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var resultField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    func setupUI() {
        timerControllerView.layer.cornerRadius =  5
    }

}

