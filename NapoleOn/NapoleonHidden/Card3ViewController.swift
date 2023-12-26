//
//  Card3ViewController.swift
//  NapoleOn
//
//  Created by Ravil on 26.12.2023.
//

import UIKit

class Card3ViewController: UIViewController {
    
    var correctAnswersCount = 0
    var teamNames: [String] = []
    var currentTeamIndex: Int = 0
    
    var isSwordPressed = false
    var isBallsPressed = false
    var isPipePressed = false
    var isStonePressed = false
    var isPlacePressed = false

    var timer: Timer?
    var timeRemaining: TimeInterval = 600
    var timerLabel: UILabel!
    
    let imageCard = UIImageView()
    
    let buttonSword = UIButton()
    let buttonBalls = UIButton()
    let buttonPipe = UIButton()
    let buttonStone = UIButton()
    let buttonPlace = UIButton()
    
    let swordSuccess = UIImageView()
    let ballsSuccess = UIImageView()
    let pipeSuccess = UIImageView()
    let stoneSuccess = UIImageView()
    let placeSuccess = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueUI()
        valueConstraints()
        valueNavigationBar()
        view.backgroundColor = UIColor(named: "backgroundCustom")
        startTimer()
        createImageStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetUI()
    }
    
    private func resetUI() {
        isSwordPressed = false
        isBallsPressed = false
        isPipePressed = false
        isStonePressed = false

        swordSuccess.isHidden = true
        ballsSuccess.isHidden = true
        pipeSuccess.isHidden = true
        stoneSuccess.isHidden = true

        unhideAllImages()
        
        timer?.invalidate()
        timeRemaining = 600
        updateTimerLabel()
        startTimer()
    }

    private func unhideAllImages() {
        for subview in view.subviews {
            if let stackView = subview as? UIStackView {
                stackView.arrangedSubviews.forEach { $0.isHidden = false }
            }
        }
    }
    
    private func valueUI() {
        imageCard.image = UIImage(named: "imageCard3")
        imageCard.layer.masksToBounds = true
        imageCard.contentMode = .scaleAspectFill
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageCard)
        
        buttonSword.setImage(UIImage(named: "sword"), for: .normal)
        buttonSword.translatesAutoresizingMaskIntoConstraints = false
        buttonSword.addTarget(self, action: #selector(buttonSwordOption), for: .touchUpInside)
        view.addSubview(buttonSword)
        
        buttonBalls.setImage(UIImage(named: "balls"), for: .normal)
        buttonBalls.translatesAutoresizingMaskIntoConstraints = false
        buttonBalls.addTarget(self, action: #selector(buttonBallsOption), for: .touchUpInside)
        view.addSubview(buttonBalls)
        
        buttonPipe.setImage(UIImage(named: "pipe"), for: .normal)
        buttonPipe.translatesAutoresizingMaskIntoConstraints = false
        buttonPipe.addTarget(self, action: #selector(buttonPipeOption), for: .touchUpInside)
        view.addSubview(buttonPipe)
        
        buttonStone.setImage(UIImage(named: "stone"), for: .normal)
        buttonStone.translatesAutoresizingMaskIntoConstraints = false
        buttonStone.addTarget(self, action: #selector(buttonStoneOption), for: .touchUpInside)
        view.addSubview(buttonStone)
        
        buttonPlace.setImage(UIImage(named: "place"), for: .normal)
        buttonPlace.translatesAutoresizingMaskIntoConstraints = false
        buttonPlace.addTarget(self, action: #selector(buttonPlaceOption), for: .touchUpInside)
        view.addSubview(buttonPlace)
        
        swordSuccess.image = UIImage(named: "swordSuccess")
        swordSuccess.layer.masksToBounds = true
        swordSuccess.contentMode = .scaleAspectFill
        swordSuccess.translatesAutoresizingMaskIntoConstraints = false
        swordSuccess.isHidden = true
        view.addSubview(swordSuccess)
        
        pipeSuccess.image = UIImage(named: "pipeSuccess")
        pipeSuccess.layer.masksToBounds = true
        pipeSuccess.contentMode = .scaleAspectFill
        pipeSuccess.translatesAutoresizingMaskIntoConstraints = false
        pipeSuccess.isHidden = true
        view.addSubview(pipeSuccess)
        
        ballsSuccess.image = UIImage(named: "ballsSuccess")
        ballsSuccess.layer.masksToBounds = true
        ballsSuccess.contentMode = .scaleAspectFill
        ballsSuccess.translatesAutoresizingMaskIntoConstraints = false
        ballsSuccess.isHidden = true
        view.addSubview(ballsSuccess)
        
        stoneSuccess.image = UIImage(named: "stoneSuccess")
        stoneSuccess.layer.masksToBounds = true
        stoneSuccess.contentMode = .scaleAspectFill
        stoneSuccess.translatesAutoresizingMaskIntoConstraints = false
        stoneSuccess.isHidden = true
        view.addSubview(stoneSuccess)
        
        placeSuccess.image = UIImage(named: "placeSuccess")
        placeSuccess.layer.masksToBounds = true
        placeSuccess.contentMode = .scaleAspectFill
        placeSuccess.translatesAutoresizingMaskIntoConstraints = false
        placeSuccess.isHidden = true
        view.addSubview(placeSuccess)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            imageCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonSword.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            buttonSword.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonBalls.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonBalls.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            
            buttonPipe.trailingAnchor.constraint(equalTo: buttonSword.leadingAnchor, constant: 10),
            buttonPipe.bottomAnchor.constraint(equalTo: buttonSword.topAnchor, constant: -120),
            
            buttonStone.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonStone.bottomAnchor.constraint(equalTo: buttonBalls.topAnchor, constant: -24),
            
            buttonPlace.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            buttonPlace.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            swordSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swordSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            ballsSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballsSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            pipeSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pipeSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stoneSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stoneSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            placeSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                imageCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                imageCard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            ])
        } else {
            NSLayoutConstraint.activate([
                imageCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
                imageCard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            ])
        }
    }
    
    private func createImageStackView() {
        let image1 = UIImageView()
        image1.image = UIImage(named: "sword")
        image1.contentMode = .scaleAspectFill
        
        let image2 = UIImageView()
        image2.image = UIImage(named: "balls")
        image2.contentMode = .scaleAspectFill
        
        let image3 = UIImageView()
        image3.image = UIImage(named: "pipe")
        image3.contentMode = .scaleAspectFill
        
        let image4 = UIImageView()
        image4.image = UIImage(named: "stone")
        image4.contentMode = .scaleAspectFill
        
        let image5 = UIImageView()
        image5.image = UIImage(named: "place")
        image5.contentMode = .scaleAspectFill
        
        let stackView = UIStackView(arrangedSubviews: [image1, image2, image3, image4, image5])
        stackView.axis = .horizontal
        stackView.spacing = 24
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            ])
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    
    @objc private func timerFired() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            updateTimerLabel()
        } else {
            timer?.invalidate()
            navigateToLoseCardViewController()
        }
    }
    
    private func navigateToLoseCardViewController() {
        let loseVC = LoseCardViewController()
        loseVC.teamNames = self.teamNames
        loseVC.correctAnswersCount = self.correctAnswersCount
        loseVC.currentTeamIndex = self.currentTeamIndex
        loseVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(loseVC, animated: true)
    }
    
    private func updateTimerLabel() {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func valueNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel()
        titleLabel.text = "Team"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 16)
        navigationItem.titleView = titleLabel
        
        let closeButton = UIBarButtonItem(image: UIImage(named: "closeNav"), style: .plain, target: self, action: #selector(closeButton))
        closeButton.tintColor = .white
        navigationItem.leftBarButtonItem = closeButton
        
        timerLabel = UILabel()
        timerLabel.textColor = .white
        timerLabel.font = UIFont(name: "Rubik-Bold", size: 20)
        timerLabel.textAlignment = .right
        timerLabel.lineBreakMode = .byWordWrapping
        updateTimerLabel()
        
        let timerItem = UIBarButtonItem(customView: timerLabel)
        navigationItem.rightBarButtonItem = timerItem
    }
    
    @objc private func closeButton() {
        print("close")
    }
    
    @objc private func settingsButton() {
        let settingsVC = SettingsViewController()
        let navigationController = UINavigationController(rootViewController: settingsVC)
        self.present(navigationController, animated: true)
    }
    
    @objc private func buttonSwordOption() {
        isSwordPressed = true
        checkForWinCondition()
        
        swordSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.swordSuccess.isHidden = true
            self?.hideImage1()
        }
    }
    
    @objc private func buttonBallsOption() {
        isBallsPressed = true
        checkForWinCondition()
        
        ballsSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.ballsSuccess.isHidden = true
            self?.hideImage2()
        }
    }
    
    @objc private func buttonPipeOption() {
        isPipePressed = true
        checkForWinCondition()
        
        pipeSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.pipeSuccess.isHidden = true
            self?.hideImage3()
        }
    }
    
    @objc private func buttonStoneOption() {
        isStonePressed = true
        checkForWinCondition()
        
        stoneSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.stoneSuccess.isHidden = true
            self?.hideImage4()
        }
    }
    
    @objc private func buttonPlaceOption() {
        isPlacePressed = true
        checkForWinCondition()
        
        placeSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.placeSuccess.isHidden = true
            self?.hideImage5()
        }
    }
    
    private func hideImage1() {
        for subview in view.subviews {
            if subview is UIStackView {
                let stackView = subview as! UIStackView
                if stackView.arrangedSubviews.count >= 1 {
                    let image2 = stackView.arrangedSubviews[0]
                    image2.isHidden = true
                }
            }
        }
    }
    
    private func hideImage2() {
        for subview in view.subviews {
            if subview is UIStackView {
                let stackView = subview as! UIStackView
                if stackView.arrangedSubviews.count >= 2 {
                    let image2 = stackView.arrangedSubviews[1]
                    image2.isHidden = true
                }
            }
        }
    }

    private func hideImage3() {
        for subview in view.subviews {
            if subview is UIStackView {
                let stackView = subview as! UIStackView
                if stackView.arrangedSubviews.count >= 3 {
                    let image3 = stackView.arrangedSubviews[2]
                    image3.isHidden = true
                }
            }
        }
    }
    
    private func hideImage4() {
        for subview in view.subviews {
            if subview is UIStackView {
                let stackView = subview as! UIStackView
                if stackView.arrangedSubviews.count >= 4 {
                    let image3 = stackView.arrangedSubviews[3]
                    image3.isHidden = true
                }
            }
        }
    }
    
    private func hideImage5() {
        for subview in view.subviews {
            if subview is UIStackView {
                let stackView = subview as! UIStackView
                if stackView.arrangedSubviews.count >= 5 {
                    let image3 = stackView.arrangedSubviews[4]
                    image3.isHidden = true
                }
            }
        }
    }
    
    private func checkForWinCondition() {
        if isSwordPressed && isBallsPressed && isPipePressed && isStonePressed {
            navigateToWinCardViewController()
        }
    }

    private func navigateToWinCardViewController() {
        let winVC = WinCardViewController()
        winVC.timer = timeRemaining
        winVC.teamNames = self.teamNames
        winVC.correctAnswersCount = self.correctAnswersCount
        winVC.currentTeamIndex = self.currentTeamIndex
        navigationController?.pushViewController(winVC, animated: true)
    }
}
