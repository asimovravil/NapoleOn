//
//  Card1ViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class Card1ViewController: UIViewController {

    var timer: Timer?
    var timeRemaining: TimeInterval = 600
    var timerLabel: UILabel!
    
    let imageCard = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        valueUI()
        valueConstraints()
        valueNavigationBar()
        view.backgroundColor = UIColor(named: "backgroundCustom")
        startTimer()
        createImageStackView()
    }
    
    private func valueUI() {
        imageCard.image = UIImage(named: "imageCard")
        imageCard.layer.masksToBounds = true
        imageCard.contentMode = .scaleAspectFill
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageCard)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            imageCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
        
        let stackView = UIStackView(arrangedSubviews: [image1, image2, image3, image4])
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
            print("Таймер истек!")
        }
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
        print("settings")
    }
}
