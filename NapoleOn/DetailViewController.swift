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
    }
    
    private func valueConstraints() {
        scrollView.addSubview(imageDetail)
        scrollView.addSubview(titleDesc)

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
            titleDesc.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
