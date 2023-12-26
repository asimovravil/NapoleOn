//
//  ScoreboardViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class ScoreboardViewController: UIViewController {
    
    var teamNames: [String] = []
    var correctAnswersCount: Int = 0
    var timer: TimeInterval = 0
    
    let imageBadge = UIImageView()
    let labelWin = UILabel()
    let labelTeam = UILabel()
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "backgroundCustom")
        valueUI()
        valueConstraints()
        tableView.reloadData()
        
        print("ScoreboardViewController loaded with teamNames: \(teamNames), correctAnswersCount: \(correctAnswersCount), timer: \(timer)")
        print("Team Names: \(teamNames)")
        print("Correct Answers Count: \(correctAnswersCount)")
        print("Timer: \(timer)")
    }
    
    private func valueUI() {
        imageBadge.image = UIImage(named: "badge")
        imageBadge.layer.masksToBounds = true
        imageBadge.contentMode = .scaleAspectFill
        imageBadge.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageBadge)
        
        labelWin.text = "Winner"
        labelWin.textColor = .white
        labelWin.font = UIFont(name: "Rubik-Regular", size: 16)
        labelWin.textAlignment = .center
        labelWin.numberOfLines = 0
        labelWin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelWin)
        
        labelTeam.text = "Leaderboard"
        labelTeam.textColor = .white
        labelTeam.font = UIFont(name: "Rubik-Bold", size: 40)
        labelTeam.textAlignment = .center
        labelTeam.numberOfLines = 0
        labelTeam.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTeam)
        
        tableView.register(ScoreboardCell.self, forCellReuseIdentifier: ScoreboardCell.reuseID)
        tableView.layer.cornerRadius = 26
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 74
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            imageBadge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelWin.topAnchor.constraint(equalTo: imageBadge.bottomAnchor, constant: 16),
            labelWin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelTeam.topAnchor.constraint(equalTo: labelWin.bottomAnchor, constant: 8),
            labelTeam.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: labelTeam.bottomAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                imageBadge.topAnchor.constraint(equalTo: view.topAnchor, constant: 118),
            ])
        } else {
            NSLayoutConstraint.activate([
                imageBadge.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            ])
        }
    }
}

extension ScoreboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows: \(teamNames.count)")
        return teamNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScoreboardCell.reuseID, for: indexPath) as? ScoreboardCell else {
            fatalError("Could not cast to ScoreboardCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        let teamName = teamNames[indexPath.row]
        cell.cellName.text = teamName
        cell.correctAnswerLabel.text = "\(correctAnswersCount)/10"
        cell.timerLabel.text = formatTime(timer)
        
        if indexPath.row == 0 {
            cell.placeBoard.backgroundColor = UIColor(named: "yellowCustom")
        } else {
            cell.placeBoard.backgroundColor = UIColor(named: "buttonQuizCustom")
            cell.placeLabel.text = "\(indexPath.row + 1)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
