//
//  LevelsCell.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class LevelsCell: UITableViewCell {

    static let reuseID = String(describing: LevelsCell.self)
    
    let imageCard = UIImageView()
    let labelCard = UILabel()
    let subLabelCard = UILabel()
    let closeCard = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        imageCard.image = UIImage(named: "imageCell")
        imageCard.layer.masksToBounds = true
        imageCard.contentMode = .scaleAspectFill
        imageCard.layer.cornerRadius = 10
        imageCard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageCard)
        
        labelCard.text = "Early Life and Rise to Power"
        labelCard.textColor = .white
        labelCard.font = UIFont(name: "Rubik-Medium", size: 32)
        labelCard.textAlignment = .left
        labelCard.numberOfLines = 0
        labelCard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelCard)
        
        subLabelCard.text = "Test • 10 questions"
        subLabelCard.textColor = .white.withAlphaComponent(0.60)
        subLabelCard.font = UIFont(name: "Rubik-Regular", size: 16)
        subLabelCard.textAlignment = .left
        subLabelCard.numberOfLines = 0
        subLabelCard.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subLabelCard)
        
        closeCard.image = UIImage(named: "close")
        closeCard.layer.masksToBounds = true
        closeCard.contentMode = .scaleAspectFill
        closeCard.translatesAutoresizingMaskIntoConstraints = false
        closeCard.isHidden = true
        contentView.addSubview(closeCard)
        
        NSLayoutConstraint.activate([
            imageCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageCard.heightAnchor.constraint(equalToConstant: 180),
            
            labelCard.topAnchor.constraint(equalTo: imageCard.bottomAnchor, constant: 16),
            labelCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            subLabelCard.topAnchor.constraint(equalTo: labelCard.bottomAnchor, constant: 8),
            subLabelCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            closeCard.centerXAnchor.constraint(equalTo: imageCard.centerXAnchor),
            closeCard.centerYAnchor.constraint(equalTo: imageCard.centerYAnchor),
        ])
    }
}
