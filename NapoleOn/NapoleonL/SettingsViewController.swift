//
//  SettingsViewController.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit
import StoreKit

class SettingsViewController: UIViewController {

    let settings1 = UIImageView()
    let settings2 = UIButton()
    let settings3 = UIButton()
    let settings4 = UIButton()
    let toggleButonSwitch = UISwitch(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "backgroundCustom")
        setupValue()
        valueConstraints()
        valueNavigationBar()
    }
    
    private func setupValue() {
        view.addSubview(settings1)
        view.addSubview(settings2)
        view.addSubview(settings3)
        view.addSubview(settings4)
        view.addSubview(toggleButonSwitch)
        
        settings1.image = UIImage(named: "settings1")
        settings1.layer.masksToBounds = true
        settings1.contentMode = .scaleAspectFill
        settings1.translatesAutoresizingMaskIntoConstraints = false
        
        settings2.setImage(UIImage(named: "settings2"), for: .normal)
        settings2.translatesAutoresizingMaskIntoConstraints = false
        
        settings3.setImage(UIImage(named: "settings3"), for: .normal)
        settings3.translatesAutoresizingMaskIntoConstraints = false
        
        settings4.setImage(UIImage(named: "settings4"), for: .normal)
        settings4.translatesAutoresizingMaskIntoConstraints = false
        
        toggleButonSwitch.setOn(true, animated: true)
        toggleButonSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        toggleButonSwitch.addTarget(self, action: #selector(switchTon(_:)), for: .valueChanged)
        settings2.addTarget(self, action: #selector(settings2Metod), for: .touchUpInside)
        settings3.addTarget(self, action: #selector(settings3Metod), for: .touchUpInside)
        settings4.addTarget(self, action: #selector(settings4Metod), for: .touchUpInside)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            settings1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settings2.topAnchor.constraint(equalTo: settings1.bottomAnchor),
            settings2.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            settings3.topAnchor.constraint(equalTo: settings2.bottomAnchor),
            settings3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settings4.topAnchor.constraint(equalTo: settings3.bottomAnchor),
            settings4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            toggleButonSwitch.trailingAnchor.constraint(equalTo: settings1.trailingAnchor, constant: -16),
            toggleButonSwitch.centerYAnchor.constraint(equalTo: settings1.centerYAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                settings1.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            ])
        } else {
            NSLayoutConstraint.activate([
                settings1.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            ])
        }
    }
    
    private func valueNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let closeButton = UIBarButtonItem(image: UIImage(named: "closeset"), style: .plain, target: self, action: #selector(closeButtonTapped))
        closeButton.tintColor = .white
        navigationItem.rightBarButtonItem = closeButton
        
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Rubik-Bold", size: 24)
        navigationItem.titleView = titleLabel

        navigationController?.navigationBar.shadowImage = UIImage()
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(named: "backgroundCustom")
        
        let borderBottom = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
        borderBottom.backgroundColor = .gray.withAlphaComponent(0.30)
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        
        navigationController?.navigationBar.layoutIfNeeded()
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.addSubview(borderBottom)

            NSLayoutConstraint.activate([
                borderBottom.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
                borderBottom.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
                borderBottom.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
                borderBottom.heightAnchor.constraint(equalToConstant: 1)
            ])
            
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.compactAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func settings2Metod() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func settings3Metod() {
        SKStoreReviewController.requestReview()
    }
    
    @objc func settings4Metod() {
        let controller = PrivacyController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func switchTon(_ sender : UISwitch){
        if sender.isOn {
            print("On")
        } else {
            print("No")
        }
    }
}
