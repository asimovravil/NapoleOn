//
//  Card2ViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class Card2ViewController: UIViewController {
    
    var selectedCardNumber: Int?
    
    var correctAnswersCount = 0
    var teamNames: [String] = []
    var currentTeamIndex: Int = 0
    
    var isSwordPressed = false
    var isGunPressed = false
    var isShieldPressed = false
    var isStonePressed = false
    var isBigStonePressed = false

    var timer: Timer?
    var timeRemaining: TimeInterval = 600
    var timerLabel: UILabel!
    
    let imageCard = UIImageView()
    
    let buttonSword = UIButton()
    let buttonGun = UIButton()
    let ButtonShield = UIButton()
    let buttonStone = UIButton()
    let buttonBigStone = UIButton()
    
    let swordSuccess = UIImageView()
    let gunSuccess = UIImageView()
    let shieldSuccess = UIImageView()
    let stoneSuccess = UIImageView()
    let bigstoneSuccess = UIImageView()
    
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
        isGunPressed = false
        isShieldPressed = false
        isStonePressed = false

        swordSuccess.isHidden = true
        gunSuccess.isHidden = true
        shieldSuccess.isHidden = true
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
        imageCard.image = UIImage(named: "imageCard2")
        imageCard.layer.masksToBounds = true
        imageCard.contentMode = .scaleAspectFill
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageCard)
        
        buttonSword.setImage(UIImage(named: "sword"), for: .normal)
        buttonSword.translatesAutoresizingMaskIntoConstraints = false
        buttonSword.addTarget(self, action: #selector(buttonSwordOption), for: .touchUpInside)
        view.addSubview(buttonSword)
        
        buttonGun.setImage(UIImage(named: "gun"), for: .normal)
        buttonGun.translatesAutoresizingMaskIntoConstraints = false
        buttonGun.addTarget(self, action: #selector(buttonBallsOption), for: .touchUpInside)
        view.addSubview(buttonGun)
        
        ButtonShield.setImage(UIImage(named: "shield"), for: .normal)
        ButtonShield.translatesAutoresizingMaskIntoConstraints = false
        ButtonShield.addTarget(self, action: #selector(buttonPipeOption), for: .touchUpInside)
        view.addSubview(ButtonShield)
        
        buttonStone.setImage(UIImage(named: "stone"), for: .normal)
        buttonStone.translatesAutoresizingMaskIntoConstraints = false
        buttonStone.addTarget(self, action: #selector(buttonStoneOption), for: .touchUpInside)
        view.addSubview(buttonStone)
        
        buttonBigStone.setImage(UIImage(named: "bigstone"), for: .normal)
        buttonBigStone.translatesAutoresizingMaskIntoConstraints = false
        buttonBigStone.addTarget(self, action: #selector(buttonBigStoneOption), for: .touchUpInside)
        view.addSubview(buttonBigStone)
        
        swordSuccess.image = UIImage(named: "swordSuccess")
        swordSuccess.layer.masksToBounds = true
        swordSuccess.contentMode = .scaleAspectFill
        swordSuccess.translatesAutoresizingMaskIntoConstraints = false
        swordSuccess.isHidden = true
        view.addSubview(swordSuccess)
        
        shieldSuccess.image = UIImage(named: "shieldSuccess")
        shieldSuccess.layer.masksToBounds = true
        shieldSuccess.contentMode = .scaleAspectFill
        shieldSuccess.translatesAutoresizingMaskIntoConstraints = false
        shieldSuccess.isHidden = true
        view.addSubview(shieldSuccess)
        
        gunSuccess.image = UIImage(named: "gunSuccess")
        gunSuccess.layer.masksToBounds = true
        gunSuccess.contentMode = .scaleAspectFill
        gunSuccess.translatesAutoresizingMaskIntoConstraints = false
        gunSuccess.isHidden = true
        view.addSubview(gunSuccess)
        
        stoneSuccess.image = UIImage(named: "stoneSuccess")
        stoneSuccess.layer.masksToBounds = true
        stoneSuccess.contentMode = .scaleAspectFill
        stoneSuccess.translatesAutoresizingMaskIntoConstraints = false
        stoneSuccess.isHidden = true
        view.addSubview(stoneSuccess)
        
        bigstoneSuccess.image = UIImage(named: "bigstoneSuccess")
        bigstoneSuccess.layer.masksToBounds = true
        bigstoneSuccess.contentMode = .scaleAspectFill
        bigstoneSuccess.translatesAutoresizingMaskIntoConstraints = false
        bigstoneSuccess.isHidden = true
        view.addSubview(bigstoneSuccess)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            imageCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonSword.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            buttonSword.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonGun.topAnchor.constraint(equalTo: buttonSword.bottomAnchor, constant: 120),
            buttonGun.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            ButtonShield.topAnchor.constraint(equalTo: buttonStone.bottomAnchor, constant: 10),
            ButtonShield.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            buttonStone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110),
            buttonStone.bottomAnchor.constraint(equalTo: buttonSword.topAnchor, constant: -62),
            
            buttonBigStone.topAnchor.constraint(equalTo: buttonGun.topAnchor, constant: 10),
            buttonBigStone.trailingAnchor.constraint(equalTo: buttonGun.leadingAnchor, constant: -10),
            
            swordSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swordSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            gunSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gunSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            shieldSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shieldSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stoneSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stoneSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            bigstoneSuccess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bigstoneSuccess.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
        image2.image = UIImage(named: "gun")
        image2.contentMode = .scaleAspectFill
        
        let image3 = UIImageView()
        image3.image = UIImage(named: "shield")
        image3.contentMode = .scaleAspectFill
        
        let image4 = UIImageView()
        image4.image = UIImage(named: "stone")
        image4.contentMode = .scaleAspectFill
        
        let image5 = UIImageView()
        image5.image = UIImage(named: "bigstone")
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
        loseVC.selectedCardNumber = self.selectedCardNumber
        print("Navigating to LoseCardViewController with teamNames: \(teamNames), correctAnswersCount: \(correctAnswersCount), timer: \(timeRemaining)")
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
        isGunPressed = true
        checkForWinCondition()
        
        gunSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.gunSuccess.isHidden = true
            self?.hideImage2()
        }
    }
    
    @objc private func buttonPipeOption() {
        isShieldPressed = true
        checkForWinCondition()
        
        shieldSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.shieldSuccess.isHidden = true
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
    
    @objc private func buttonBigStoneOption() {
        isBigStonePressed = true
        checkForWinCondition()
        
        bigstoneSuccess.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            self?.bigstoneSuccess.isHidden = true
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
        if isSwordPressed && isGunPressed && isShieldPressed && isStonePressed {
            navigateToWinCardViewController()
        }
    }

    private func navigateToWinCardViewController() {
        let winVC = WinCardViewController()
        winVC.timer = timeRemaining
        winVC.teamNames = self.teamNames
        winVC.correctAnswersCount = self.correctAnswersCount
        winVC.currentTeamIndex = self.currentTeamIndex
        winVC.selectedCardNumber = self.selectedCardNumber
        print("Navigating to WinCardViewController with teamNames: \(teamNames), correctAnswersCount: \(correctAnswersCount), timer: \(timeRemaining)")
        navigationController?.pushViewController(winVC, animated: true)
    }
}
