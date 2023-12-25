//
//  DetailViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class DetailInfoViewController: UIViewController {

    let imageDetail = UIImageView()
    let titleDetail = UILabel()
    let titleDesc = UILabel()
    let scrollView = UIScrollView()
    let buttonDetail = UIButton(type: .system)
    
    var info: Info?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCustom")
        valueUI()
        valueConstraints()
        
        if let info = info {
            imageDetail.image = info.image
            titleDetail.text = info.title
            titleDesc.text = info.description
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonDetail.layer.cornerRadius = 10
    }
    
    private func valueUI() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        imageDetail.image = UIImage(named: "imageCard1")
        imageDetail.layer.masksToBounds = true
        imageDetail.contentMode = .scaleAspectFill
        imageDetail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageDetail)
        
        titleDetail.textColor = .white
        titleDetail.font = UIFont(name: "Rubik-Medium", size: 32)
        titleDetail.textAlignment = .left
        titleDetail.numberOfLines = 0
        titleDetail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleDetail)
        
        titleDesc.textColor = .white
        titleDesc.font = UIFont(name: "Rubik-Regular", size: 16)
        titleDesc.textAlignment = .left
        titleDesc.numberOfLines = 0
        titleDesc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleDesc)
        
        buttonDetail.setTitle("Pass the test", for: .normal)
        buttonDetail.setTitleColor(.white, for: .normal)
        buttonDetail.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 18)
        buttonDetail.contentHorizontalAlignment = .center
        buttonDetail.backgroundColor = UIColor(named: "redCustom")
        buttonDetail.titleLabel?.numberOfLines = 0
        buttonDetail.translatesAutoresizingMaskIntoConstraints = false
        buttonDetail.addTarget(self, action: #selector(buttonDetailOption), for: .touchUpInside)
        view.addSubview(buttonDetail)
    }
    
    private func valueConstraints() {
        scrollView.addSubview(imageDetail)
        scrollView.addSubview(titleDetail)
        scrollView.addSubview(titleDesc)
        scrollView.addSubview(buttonDetail)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageDetail.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageDetail.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageDetail.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageDetail.heightAnchor.constraint(equalToConstant: 200),
            
            titleDetail.topAnchor.constraint(equalTo: imageDetail.bottomAnchor, constant: 24),
            titleDetail.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            titleDetail.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            titleDesc.topAnchor.constraint(equalTo: titleDetail.bottomAnchor, constant: 16),
            titleDesc.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            titleDesc.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            titleDesc.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),

            buttonDetail.topAnchor.constraint(equalTo: titleDesc.bottomAnchor, constant: 24),
            buttonDetail.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            buttonDetail.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            buttonDetail.heightAnchor.constraint(equalToConstant: 53)
        ])
        let bottomConstraint = buttonDetail.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -20)
        bottomConstraint.priority = .required
        bottomConstraint.isActive = true
    }


    
    @objc private func buttonDetailOption() {
        let createVC = CreateViewController()
        createVC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(createVC, animated: true)
    }
}
