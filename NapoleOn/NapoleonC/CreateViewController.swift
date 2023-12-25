//
//  CreateViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class CreateViewController: UIViewController {
    
    var numberOfPlayers = 2
    var playerNames: [String] = []
    
    let createLabel = UILabel()
    let tableViewAliasTeam = UITableView(frame: .zero, style: .plain)
    let createStart = UIButton()
    let createPlus = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCustom")
        valueNavigationBar()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        createStart.layer.cornerRadius = 10
    }
    
    private func setupUI() {
        createLabel.text = "To start the game, \ncreate teams"
        createLabel.textColor = .white
        createLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        createLabel.textAlignment = .center
        createLabel.numberOfLines = 0
        createLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createLabel)
        
        tableViewAliasTeam.register(CreateCell.self, forCellReuseIdentifier: CreateCell.id)
        tableViewAliasTeam.dataSource = self
        tableViewAliasTeam.delegate = self
        tableViewAliasTeam.showsVerticalScrollIndicator = false
        tableViewAliasTeam.isUserInteractionEnabled = true
        tableViewAliasTeam.backgroundColor = .clear
        tableViewAliasTeam.separatorStyle = .none
        tableViewAliasTeam.rowHeight = 88
        tableViewAliasTeam.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableViewAliasTeam)
        
        createStart.setTitle("Start", for: .normal)
        createStart.setTitleColor(.white, for: .normal)
        createStart.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 18)
        createStart.contentHorizontalAlignment = .center
        createStart.backgroundColor = UIColor(named: "redCustom")
        createStart.titleLabel?.numberOfLines = 0
        createStart.translatesAutoresizingMaskIntoConstraints = false
        createStart.addTarget(self, action: #selector(quizStartTapped), for: .touchUpInside)
        view.addSubview(createStart)
        
        createPlus.setImage(UIImage(named: "add"), for: .normal)
        createPlus.addTarget(self, action: #selector(createPlusOption), for: .touchUpInside)
        createPlus.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createPlus)
        
        NSLayoutConstraint.activate([
            createLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableViewAliasTeam.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 32),
            tableViewAliasTeam.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewAliasTeam.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewAliasTeam.bottomAnchor.constraint(equalTo: createPlus.topAnchor, constant: -24),
            
            createStart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            createStart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            createStart.heightAnchor.constraint(equalToConstant: 53),

            createPlus.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createPlus.bottomAnchor.constraint(equalTo: createStart.topAnchor, constant: -20),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                createLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
                createStart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            ])
        } else {
            NSLayoutConstraint.activate([
                createLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                createStart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }
    
    @objc private func quizStartTapped() {
        let quizGameViewController = QuizGameViewController()
        navigationController?.pushViewController(quizGameViewController, animated: true)
    }
    
    @objc private func createPlusOption() {
        numberOfPlayers += 1
        tableViewAliasTeam.reloadData()
        validateStartButton()
    }
    
    private func valueNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let imageView = UIImageView(image: UIImage(named: "napoleonLogo"))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: imageView), flexibleSpace]
        
        let settingsButton = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButton))
        settingsButton.tintColor = .white
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc private func settingsButton() {
        print("settings")
    }
}

extension CreateViewController: UITableViewDataSource, UITableViewDelegate, CreateCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPlayers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateCell.id, for: indexPath) as? CreateCell else {
            fatalError("Could not cast to QuizTeamCell")
        }
        cell.delegate = self
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.teamPlaceHolder.placeholder = "Team \(indexPath.row + 1)"
        
        if indexPath.row < playerNames.count {
            cell.teamPlaceHolder.text = playerNames[indexPath.row]
        } else {
            cell.teamPlaceHolder.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func didTapAliasPlus() {
        numberOfPlayers += 1
        tableViewAliasTeam.reloadData()
    }
    
    func didChangeText(newText: String, in cell: CreateCell) {
        if let indexPath = tableViewAliasTeam.indexPath(for: cell) {
            if indexPath.row < playerNames.count {
                playerNames[indexPath.row] = newText
            } else {
                playerNames.append(newText)
            }
        }
        validateStartButton()
    }
    
    
    private func validateStartButton() {
        var allFieldsValid = true
        for i in 0..<numberOfPlayers {
            if let cell = tableViewAliasTeam.cellForRow(at: IndexPath(row: i, section: 0)) as? CreateCell {
                if cell.teamPlaceHolder.text?.count ?? 0 < 3 {
                    allFieldsValid = false
                    break
                }
            }
        }
        createStart.isEnabled = allFieldsValid
    }
}
