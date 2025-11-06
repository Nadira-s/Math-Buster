//
//  WelcomeViewController.swift
//  Math Buster
//
//  Created by Nadira Seitkazy  on 04.11.2025.
//

import UIKit

class WelcomeViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [userScoreSection] = []{
        didSet {
            print("Value of variable 'dataSource' was changed")
            if isViewLoaded {
                tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: ScoreTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(getUserScore), for: .valueChanged)
        tableView.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserScore()
    }
    
    @objc
    func getUserScore() {
        tableView.refreshControl?.endRefreshing()
      
        var easyScoreList = ViewController.getAllUserScore(level: .easy)
        let easySection = userScoreSection(list: easyScoreList, title: "Easy")
       

        
        var mediumScoreList = ViewController.getAllUserScore(level: .medium)
        let mediumSection = userScoreSection(list: mediumScoreList, title: "Medium")
       
        var hardScoreList = ViewController.getAllUserScore(level: .hard)
        let hardSection = userScoreSection(list: hardScoreList, title: "Hard")
       
        
        self.dataSource = [easySection, mediumSection, hardSection]
    }
    
    func getSingleUserText(indexPath: IndexPath) -> String? {
        let userScore: UserScore = dataSource[indexPath.section].list[indexPath.row]
        let text = "Name: \(userScore.name), Score: \(userScore.score)"
        return text
    }
}
    
extension  WelcomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScoreTableViewCell.identifier,for: indexPath) as! ScoreTableViewCell
        
        cell.scoreTextLabel.text = getSingleUserText(indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User selected  row: \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = ScoreDetailViewController()
        viewController.text = getSingleUserText(indexPath: indexPath)
        navigationController?.pushViewController(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].title
    }
}

struct userScoreSection{
    let list: [UserScore]
    let title: String
}
