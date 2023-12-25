//
//  LevelsViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class LevelsViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "backgroundCustom")
        valueUI()
        valueConstraints()
        valueNavigationBar()
    }
    
    private func valueUI() {
        tableView.register(LevelsCell.self, forCellReuseIdentifier: LevelsCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 323
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func valueNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let settingsButton = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButton))
        settingsButton.tintColor = .white
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc private func settingsButton() {
        print("settings")
    }
}

extension LevelsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LevelsCell.reuseID, for: indexPath) as? LevelsCell else {
            fatalError("Could not cast to LevelsCell")
        }
        
        configureCell(cell, forRowAt: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loaderVC = LoaderViewController()
        
        navigationController?.pushViewController(loaderVC, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let detailVC = DetailInfoViewController()
            let selectedInfo = exampleInfo[indexPath.row]
            detailVC.info = selectedInfo
            
            self.navigationController?.popViewController(animated: false)

            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func configureCell(_ cell: LevelsCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        switch indexPath.row {
        case 0: break
        case 1:
            cell.imageCard.image = UIImage(named: "imageCell2")
            cell.labelCard.text = "The French Revolution"
            cell.closeCard.isHidden = false
            cell.imageCard.alpha = 0.60
        case 2:
            cell.imageCard.image = UIImage(named: "imageCell3")
            cell.labelCard.text = "Coup of 18 Brumaire"
            cell.closeCard.isHidden = false
            cell.imageCard.alpha = 0.60
        case 3:
            cell.imageCard.image = UIImage(named: "imageCell4")
            cell.labelCard.text = "Napoleon as First Consul"
            cell.closeCard.isHidden = false
            cell.imageCard.alpha = 0.60
        case 4:
            cell.imageCard.image = UIImage(named: "imageCell5")
            cell.labelCard.text = "Coronation as Emperor"
            cell.closeCard.isHidden = false
            cell.imageCard.alpha = 0.60
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
}
