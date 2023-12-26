//
//  RouletteViewController.swift
//  NapoleOn
//
//  Created by Ravil on 25.12.2023.
//

import UIKit

class RouletteViewController: UIViewController {
    
    var teamNames: [String] = []
    
    var correctAnswersCount = 0
    var selectedCardNumber: Int?
    
    let backgroundRoulette = UIImageView()
    let rotationRoulette = UIImageView()
    let buttonRoulette = UIButton(type: .system)
    let cardBonus = UIView()
    let imageBonus = UIImageView()
    let labelBonus = UILabel()
    let buttonBonus = UIButton(type: .system)
    let dimmingView = UIView()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueUI()
        valueConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonRoulette.layer.cornerRadius = 10
        buttonBonus.layer.cornerRadius = 10
        cardBonus.layer.cornerRadius = 20
    }
    
    private func valueUI() {
        backgroundRoulette.image = UIImage(named: "rouletteback")
        backgroundRoulette.layer.masksToBounds = true
        backgroundRoulette.contentMode = .scaleAspectFill
        backgroundRoulette.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundRoulette)
        
        rotationRoulette.image = UIImage(named: "roulette")
        rotationRoulette.layer.masksToBounds = true
        rotationRoulette.contentMode = .scaleAspectFill
        rotationRoulette.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rotationRoulette)
        
        buttonRoulette.setTitle("Spin", for: .normal)
        buttonRoulette.setTitleColor(.white, for: .normal)
        buttonRoulette.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 18)
        buttonRoulette.contentHorizontalAlignment = .center
        buttonRoulette.backgroundColor = UIColor(named: "redCustom")
        buttonRoulette.titleLabel?.numberOfLines = 0
        buttonRoulette.translatesAutoresizingMaskIntoConstraints = false
        buttonRoulette.addTarget(self, action: #selector(buttonRouletteOption), for: .touchUpInside)
        view.addSubview(buttonRoulette)
        
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.isHidden = true
        view.addSubview(dimmingView)
        
        cardBonus.backgroundColor = UIColor(named: "backgroundCustom")
        cardBonus.isHidden = true
        cardBonus.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardBonus)
        
        imageBonus.image = UIImage(named: "card1")
        imageBonus.layer.masksToBounds = true
        imageBonus.contentMode = .scaleAspectFill
        imageBonus.translatesAutoresizingMaskIntoConstraints = false
        imageBonus.isHidden = true
        view.addSubview(imageBonus)
        
        labelBonus.text = "Your card for this game"
        labelBonus.textColor = .white
        labelBonus.font = UIFont(name: "Rubik-Medium", size: 24)
        labelBonus.textAlignment = .center
        labelBonus.numberOfLines = 0
        labelBonus.translatesAutoresizingMaskIntoConstraints = false
        labelBonus.isHidden = true
        view.addSubview(labelBonus)
        
        buttonBonus.setTitle("Start", for: .normal)
        buttonBonus.setTitleColor(.white, for: .normal)
        buttonBonus.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 18)
        buttonBonus.contentHorizontalAlignment = .center
        buttonBonus.backgroundColor = UIColor(named: "redCustom")
        buttonBonus.titleLabel?.numberOfLines = 0
        buttonBonus.translatesAutoresizingMaskIntoConstraints = false
        buttonBonus.addTarget(self, action: #selector(buttonBonusOption), for: .touchUpInside)
        buttonBonus.isHidden = true
        view.addSubview(buttonBonus)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            backgroundRoulette.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundRoulette.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundRoulette.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundRoulette.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rotationRoulette.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rotationRoulette.bottomAnchor.constraint(equalTo: buttonRoulette.topAnchor, constant: -70),
            
            buttonRoulette.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonRoulette.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonRoulette.heightAnchor.constraint(equalToConstant: 53),
            
            cardBonus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardBonus.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardBonus.bottomAnchor.constraint(equalTo: buttonRoulette.topAnchor, constant: -75),
            cardBonus.heightAnchor.constraint(equalToConstant: 421),
            
            imageBonus.topAnchor.constraint(equalTo: cardBonus.topAnchor, constant: 24),
            imageBonus.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelBonus.topAnchor.constraint(equalTo: imageBonus.bottomAnchor, constant: 24),
            labelBonus.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            buttonBonus.topAnchor.constraint(equalTo: labelBonus.bottomAnchor, constant: 24),
            buttonBonus.leadingAnchor.constraint(equalTo: cardBonus.leadingAnchor, constant: 16),
            buttonBonus.trailingAnchor.constraint(equalTo: cardBonus.trailingAnchor, constant: -16),
            buttonBonus.heightAnchor.constraint(equalToConstant: 53),
            
            dimmingView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                buttonRoulette.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            ])
        } else {
            NSLayoutConstraint.activate([
                buttonRoulette.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            ])
        }
    }

    private func valueRotation() {
        let fastFullAnimation = CGFloat(Double.pi * 2)
        let splashLoadAnim = CABasicAnimation(keyPath: "transform.rotation")
        splashLoadAnim.fromValue = 0.0
        splashLoadAnim.toValue = fastFullAnimation
        splashLoadAnim.duration = 2.0
        splashLoadAnim.repeatCount = 1
        self.rotationRoulette.layer.add(splashLoadAnim, forKey: "360rotation")

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.rotationRoulette.layer.removeAllAnimations()
            print("spin complete")

            // Randomly select an image
            let randomImageNumber = Int.random(in: 1...3)
            let imageName = "card\(randomImageNumber)"
            self.imageBonus.image = UIImage(named: imageName)
            self.selectedCardNumber = randomImageNumber

            self.cardBonus.isHidden = false
            self.imageBonus.isHidden = false
            self.labelBonus.isHidden = false
            self.buttonBonus.isHidden = false
            self.dimmingView.isHidden = false
        }
    }


    @objc private func buttonRouletteOption() {
        valueRotation()
    }

    @objc private func buttonBonusOption() {
        guard let selectedCardNumber = selectedCardNumber else {
            print("No card selected")
            return
        }
        print("Selected Card Number: \(selectedCardNumber)")
        switch selectedCardNumber {
        case 1:
            let card1VC = Card1ViewController()
            card1VC.teamNames = self.teamNames 
            card1VC.correctAnswersCount = self.correctAnswersCount
            card1VC.selectedCardNumber = self.selectedCardNumber
            print("Navigating to Card1ViewController with teamNames: \(self.teamNames), correctAnswersCount: \(self.correctAnswersCount)")
            self.navigationController?.pushViewController(card1VC, animated: true)
        case 2:
            let card2VC = Card2ViewController()
            card2VC.teamNames = self.teamNames
            card2VC.correctAnswersCount = self.correctAnswersCount
            card2VC.selectedCardNumber = self.selectedCardNumber
            print("Navigating to Card1ViewController with teamNames: \(self.teamNames), correctAnswersCount: \(self.correctAnswersCount)")
            self.navigationController?.pushViewController(card2VC, animated: true)
        case 3:
            let card3VC = Card3ViewController()
            card3VC.teamNames = self.teamNames
            card3VC.correctAnswersCount = self.correctAnswersCount
            card3VC.selectedCardNumber = self.selectedCardNumber
            print("Navigating to Card1ViewController with teamNames: \(self.teamNames), correctAnswersCount: \(self.correctAnswersCount)")
            self.navigationController?.pushViewController(card3VC, animated: true)
        default:
            print("Invalid card number")
        }
    }

}
