//
//  CreateCell.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

protocol CreateCellDelegate: AnyObject {
    func didChangeText(newText: String, in cell: CreateCell)
}

class CreateCell: UITableViewCell {
    
    let teamPlaceHolder = UITextField()
    let clearButton = UIButton(type: .custom)
    weak var delegate: CreateCellDelegate?
    
    static let id = String(describing: CreateCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.50),
            NSAttributedString.Key.font: UIFont(name: "Rubik-Medium", size: 16)!
        ]
        teamPlaceHolder.attributedPlaceholder = NSAttributedString(string: "Team", attributes: attributes)
        teamPlaceHolder.font = UIFont(name: "Rubik-Medium", size: 16)
        teamPlaceHolder.textAlignment = .center
        teamPlaceHolder.textColor = .white
        teamPlaceHolder.autocorrectionType = .no
        teamPlaceHolder.keyboardType = .default
        teamPlaceHolder.backgroundColor = UIColor(named: "buttonQuizCustom")
        teamPlaceHolder.layer.cornerRadius = 32
        teamPlaceHolder.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        teamPlaceHolder.translatesAutoresizingMaskIntoConstraints = false
        
        clearButton.setImage(UIImage(named: "xmark"), for: .normal)
        clearButton.tintColor = .white
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        contentView.addSubview(teamPlaceHolder)
        contentView.addSubview(clearButton)
        
        NSLayoutConstraint.activate([
            teamPlaceHolder.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            teamPlaceHolder.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            teamPlaceHolder.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            teamPlaceHolder.heightAnchor.constraint(equalToConstant: 64),
            
            clearButton.centerYAnchor.constraint(equalTo: teamPlaceHolder.centerYAnchor),
            clearButton.trailingAnchor.constraint(equalTo: teamPlaceHolder.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        delegate?.didChangeText(newText: textField.text ?? "", in: self)
    }
    
    @objc private func clearButtonTapped() {
        teamPlaceHolder.text = ""
    }
}
