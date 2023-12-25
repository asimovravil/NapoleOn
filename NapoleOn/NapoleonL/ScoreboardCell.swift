//
//  ScoreboardCell.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

final class ScoreboardCell: UITableViewCell {
    
    static let reuseID = String(describing: ScoreboardCell.self)
    
    let cellName = UILabel()
    let correctAnswerLabel = UILabel()
    let timerLabel = UILabel()
    let labelRound1 = UILabel()
    let labelRound2 = UILabel()
    let placeBoard = UIView()
    let placeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        

        valueUI()
        valueConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func valueUI() {
        contentView.addSubview(cellName)
        contentView.addSubview(correctAnswerLabel)
        contentView.addSubview(timerLabel)
        contentView.addSubview(labelRound1)
        contentView.addSubview(labelRound2)
        
        cellName.text = "Team 1"
        cellName.textColor = .white
        cellName.numberOfLines = 0
        cellName.font = UIFont(name: "Rubik-Medium", size: 16)
        cellName.translatesAutoresizingMaskIntoConstraints = false
        
        correctAnswerLabel.text = "10/10"
        correctAnswerLabel.textColor = UIColor(named: "greenCustom")
        correctAnswerLabel.numberOfLines = 0
        correctAnswerLabel.font = UIFont(name: "Rubik-Bold", size: 20)
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timerLabel.text = "10:00"
        timerLabel.textColor = UIColor(named: "greenCustom")
        timerLabel.numberOfLines = 0
        timerLabel.font = UIFont(name: "Rubik-Bold", size: 20)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        labelRound1.text = "Round 1"
        labelRound1.textColor = .white.withAlphaComponent(0.60)
        labelRound1.numberOfLines = 0
        labelRound1.font = UIFont(name: "Rubik-Regular", size: 12)
        labelRound1.translatesAutoresizingMaskIntoConstraints = false
        
        labelRound2.text = "Round 2"
        labelRound2.textColor = .white.withAlphaComponent(0.60)
        labelRound2.numberOfLines = 0
        labelRound2.font = UIFont(name: "Rubik-Regular", size: 12)
        labelRound2.translatesAutoresizingMaskIntoConstraints = false
        
        placeBoard.backgroundColor = UIColor(named: "buttonQuizCustom")
        placeBoard.translatesAutoresizingMaskIntoConstraints = false
        placeBoard.layer.cornerRadius = 10
        contentView.addSubview(placeBoard)
        
        placeLabel.text = "1"
        placeLabel.textColor = .white
        placeLabel.numberOfLines = 0
        placeLabel.font = UIFont(name: "Rubik-Medium", size: 16)
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(placeLabel)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            cellName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellName.leadingAnchor.constraint(equalTo: placeBoard.trailingAnchor, constant: 16),
            
            labelRound1.bottomAnchor.constraint(equalTo: correctAnswerLabel.topAnchor, constant: -4),
            labelRound1.centerXAnchor.constraint(equalTo: correctAnswerLabel.centerXAnchor),

            labelRound2.bottomAnchor.constraint(equalTo: timerLabel.topAnchor, constant: -4),
            labelRound2.centerXAnchor.constraint(equalTo: timerLabel.centerXAnchor),
            
            correctAnswerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            correctAnswerLabel.trailingAnchor.constraint(equalTo: timerLabel.leadingAnchor, constant: -16),
            
            timerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            placeBoard.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            placeBoard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placeBoard.widthAnchor.constraint(equalToConstant: 40),
            placeBoard.heightAnchor.constraint(equalToConstant: 40),
            
            placeLabel.centerXAnchor.constraint(equalTo: placeBoard.centerXAnchor),
            placeLabel.centerYAnchor.constraint(equalTo: placeBoard.centerYAnchor),
        ])
    }
}

