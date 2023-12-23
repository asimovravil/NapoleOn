//
//  TrainingViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class TrainingViewController: UIViewController {

    let backgroundTraining = UIImageView()
    let labelTraining = UILabel()
    let pageControlTraining = UIPageControl()
    let buttonTraining = UIButton(type: .system)
    let labelGameMechanicsTraining = UILabel()
    let FAQTraining = UIImageView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCustom")
        valueUI()
        valueConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonTraining.layer.cornerRadius = 10
    }

    private func valueUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        backgroundTraining.image = UIImage(named: "tra1Background")
        backgroundTraining.layer.masksToBounds = true
        backgroundTraining.contentMode = .scaleAspectFill
        backgroundTraining.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundTraining)
        
        labelTraining.text = "The Best Team game for Napoleon fans"
        labelTraining.textColor = .white
        labelTraining.font = UIFont(name: "Rubik-Medium", size: 32)
        labelTraining.textAlignment = .center
        labelTraining.numberOfLines = 0
        labelTraining.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelTraining)
        
        pageControlTraining.currentPageIndicatorTintColor = .white
        pageControlTraining.pageIndicatorTintColor = .white.withAlphaComponent(0.5)
        pageControlTraining.numberOfPages = 2
        pageControlTraining.currentPage = 0
        pageControlTraining.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControlTraining)
        
        buttonTraining.setTitle("Next", for: .normal)
        buttonTraining.setTitleColor(.white, for: .normal)
        buttonTraining.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 18)
        buttonTraining.contentHorizontalAlignment = .center
        buttonTraining.backgroundColor = UIColor(named: "redCustom")
        buttonTraining.titleLabel?.numberOfLines = 0
        buttonTraining.translatesAutoresizingMaskIntoConstraints = false
        buttonTraining.addTarget(self, action: #selector(buttonTrainingOption), for: .touchUpInside)
        view.addSubview(buttonTraining)
        
        labelGameMechanicsTraining.text = "Game Mechanics"
        labelGameMechanicsTraining.textColor = .white
        labelGameMechanicsTraining.font = UIFont(name: "Rubik-Medium", size: 40)
        labelGameMechanicsTraining.textAlignment = .center
        labelGameMechanicsTraining.numberOfLines = 0
        labelGameMechanicsTraining.translatesAutoresizingMaskIntoConstraints = false
        labelGameMechanicsTraining.isHidden = true
        view.addSubview(labelGameMechanicsTraining)
        
        FAQTraining.image = UIImage(named: "trainingFAQ")
        FAQTraining.layer.masksToBounds = true
        FAQTraining.contentMode = .scaleAspectFill
        FAQTraining.translatesAutoresizingMaskIntoConstraints = false
        FAQTraining.isHidden = true
        scrollView.addSubview(FAQTraining)
        
        let skipButton = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(skipButtonTapped))
        skipButton.tintColor = .white.withAlphaComponent(0.6)
        navigationItem.rightBarButtonItem = skipButton
    }
    
    @objc private func skipButtonTapped() {
        print("skip")
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: buttonTraining.topAnchor, constant: -16),
            
            backgroundTraining.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundTraining.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundTraining.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundTraining.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            labelTraining.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelTraining.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            labelTraining.bottomAnchor.constraint(equalTo: pageControlTraining.topAnchor, constant: -32),
            
            pageControlTraining.bottomAnchor.constraint(equalTo: buttonTraining.topAnchor, constant: -32),
            pageControlTraining.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControlTraining.heightAnchor.constraint(equalToConstant: 20),
            
            buttonTraining.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonTraining.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonTraining.heightAnchor.constraint(equalToConstant: 53),
            
            labelGameMechanicsTraining.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelGameMechanicsTraining.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            FAQTraining.topAnchor.constraint(equalTo: scrollView.topAnchor),
            FAQTraining.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            FAQTraining.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: labelGameMechanicsTraining.bottomAnchor, constant: 32),
                labelGameMechanicsTraining.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                buttonTraining.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            ])
        } else {
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: labelGameMechanicsTraining.bottomAnchor, constant: 16),
                labelGameMechanicsTraining.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                buttonTraining.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            ])
        }
    }
    
    @objc private func buttonTrainingOption() {
        if pageControlTraining.currentPage < 1 {
            pageControlTraining.currentPage += 1
            
            if pageControlTraining.currentPage == 1 {
                backgroundTraining.isHidden = true
                labelTraining.isHidden = true
                
                labelGameMechanicsTraining.isHidden = false
                FAQTraining.isHidden = false
                buttonTraining.setTitle("Start", for: .normal)
            }
        } else {
            print("good")
        }
    }
}

