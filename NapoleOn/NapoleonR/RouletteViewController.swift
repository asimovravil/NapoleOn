//
//  RouletteViewController.swift
//  NapoleOn
//
//  Created by Ravil on 25.12.2023.
//

import UIKit

class RouletteViewController: UIViewController {
    
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
        print("game")
    }
}
