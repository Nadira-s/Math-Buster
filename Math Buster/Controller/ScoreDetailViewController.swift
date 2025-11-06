//
//  ScoreDetailViewController.swift
//  Math Buster
//
//  Created by Nadira Seitkazy  on 05.11.2025.
//

import UIKit

class ScoreDetailViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textLabel.text = text
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goBackButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


