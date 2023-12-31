//
//  LoseCardViewController.swift
//  NapoleOn
//
//  Created by Ravil on 25.12.2023.
//

import UIKit

class LoseCardViewController: UIViewController {
    
    var selectedCardNumber: Int?
    
    var correctAnswersCount = 0
    var teamNames: [String] = []
    var currentTeamIndex: Int = 0

    var teamName: String = ""
    var score: Int = 0
    
    let backgroundWin = UIImageView()
    let labelTime = UILabel()
    let buttonNext = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCustom")
        valueUI()
        valueConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonNext.layer.cornerRadius = 10
    }

    private func valueUI() {
        backgroundWin.image = UIImage(named: "cardlose")
        backgroundWin.layer.masksToBounds = true
        backgroundWin.contentMode = .scaleAspectFill
        backgroundWin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundWin)
        
        labelTime.text = "Time is over!"
        labelTime.textColor = .white
        labelTime.font = UIFont(name: "Rubik-Bold", size: 32)
        labelTime.textAlignment = .center
        labelTime.numberOfLines = 0
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTime)
        
        buttonNext.setTitle("Next Team", for: .normal)
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 18)
        buttonNext.contentHorizontalAlignment = .center
        buttonNext.backgroundColor = UIColor(named: "redCustom")
        buttonNext.titleLabel?.numberOfLines = 0
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        buttonNext.addTarget(self, action: #selector(buttonTrainingOption), for: .touchUpInside)
        view.addSubview(buttonNext)
        
        let closeButton = UIBarButtonItem(image: UIImage(named: "closeNav"), style: .plain, target: self, action: #selector(closeButton))
        closeButton.tintColor = .white
        navigationItem.rightBarButtonItem = closeButton
    }
    
    @objc private func closeButton() {
        let levelsVC = LevelsViewController()
        levelsVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(levelsVC, animated: true)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            backgroundWin.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundWin.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundWin.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundWin.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelTime.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTime.bottomAnchor.constraint(equalTo: buttonNext.topAnchor, constant: -64),
            
            buttonNext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonNext.heightAnchor.constraint(equalToConstant: 53),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                buttonNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            ])
        } else {
            NSLayoutConstraint.activate([
                buttonNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            ])
        }
    }
    
    @objc private func buttonTrainingOption() {
        if currentTeamIndex < teamNames.count - 1 {
            currentTeamIndex += 1
            navigateToGameController()
        } else {
            let scoreboardVC = ScoreboardViewController()
            scoreboardVC.teamNames = teamNames
            scoreboardVC.correctAnswersCount = correctAnswersCount
            navigationController?.pushViewController(scoreboardVC, animated: true)
        }
    }

    private func navigateToGameController() {
        guard let cardNumber = selectedCardNumber else { return }

        switch cardNumber {
        case 1:
            let card1VC = Card1ViewController()
            card1VC.currentTeamIndex = currentTeamIndex
            navigationController?.pushViewController(card1VC, animated: true)
        case 2:
            let card2VC = Card2ViewController()
            card2VC.currentTeamIndex = currentTeamIndex
            navigationController?.pushViewController(card2VC, animated: true)
        case 3:
            let card3VC = Card3ViewController()
            card3VC.currentTeamIndex = currentTeamIndex
            navigationController?.pushViewController(card3VC, animated: true)
        default:
            print("Invalid card number")
        }
    }
}

