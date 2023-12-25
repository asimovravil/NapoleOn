//
//  LoaderViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class LoaderViewController: UIViewController {
    
    let labelTopic = UILabel()
    let imageTopic1 = UIImageView()
    let imageTopic2 = UIImageView()
    let rotationTopic = UIImageView()
    let topicNapoleon = UIImageView()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCustom")

        valueUI()
        valueConstraints()
        valueRotation()
    }
    
    private func valueUI() {
        labelTopic.text = "Games in this topic"
        labelTopic.textColor = .white.withAlphaComponent(0.60)
        labelTopic.font = UIFont(name: "Rubik-Regular", size: 16)
        labelTopic.textAlignment = .center
        labelTopic.numberOfLines = 0
        labelTopic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTopic)
        
        imageTopic1.image = UIImage(named: "topic1")
        imageTopic1.layer.masksToBounds = true
        imageTopic1.contentMode = .scaleAspectFill
        imageTopic1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageTopic1)
        
        imageTopic2.image = UIImage(named: "topic2")
        imageTopic2.layer.masksToBounds = true
        imageTopic2.contentMode = .scaleAspectFill
        imageTopic2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageTopic2)
                
        rotationTopic.image = UIImage(named: "coinLoad")
        rotationTopic.layer.masksToBounds = true
        rotationTopic.contentMode = .scaleAspectFill
        rotationTopic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rotationTopic)
        
        topicNapoleon.image = UIImage(named: "napoleonHidden")
        topicNapoleon.layer.masksToBounds = true
        topicNapoleon.contentMode = .scaleAspectFill
        topicNapoleon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topicNapoleon)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            labelTopic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageTopic1.topAnchor.constraint(equalTo: labelTopic.bottomAnchor, constant: 32),
            imageTopic1.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            imageTopic2.topAnchor.constraint(equalTo: imageTopic1.bottomAnchor, constant: 32),
            imageTopic2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rotationTopic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            topicNapoleon.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topicNapoleon.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                labelTopic.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                rotationTopic.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -115)
            ])
        } else {
            NSLayoutConstraint.activate([
                labelTopic.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                rotationTopic.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
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
        self.rotationTopic.layer.add(splashLoadAnim, forKey: "360rotation")
    }
}
