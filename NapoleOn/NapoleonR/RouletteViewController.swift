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

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueUI()
        valueConstraints()
        valueRotation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonRoulette.layer.cornerRadius = 10
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
        splashLoadAnim.duration = 1.0
        splashLoadAnim.repeatCount = .greatestFiniteMagnitude
        self.rotationRoulette.layer.add(splashLoadAnim, forKey: "360rotation")
    }
    
    @objc private func buttonRouletteOption() {
        print("spin")
    }
}
