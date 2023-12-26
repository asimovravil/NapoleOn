//
//  QuizViewController.swift
//  NapoleOn
//
//  Created by Ravil on 23.12.2023.
//

import UIKit

class QuizGameViewController: UIViewController {

    var teamNames: [String] = []
    var currentTeamIndex = 0
    
    let titleCard = UIView()
    let titleAmount = UILabel()
    let titleWord = UILabel()
    
    let buttonFirstAnswer = UIButton()
    let buttonSecondAnswer = UIButton()
    let buttonThirdAnswer = UIButton()
    
    var currentQuestionIndex = 0
    var correctAnswersCount = 0
    
    var quiz: [QuizNapoleon] = [
        QuizNapoleon(
            question: "Where was Napoleon Bonaparte born?",
            answers: ["Paris", "Ajaccio", "Genoa"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "How old was Napoleon when he was sent to mainland France?",
            answers: ["7", "9", "11"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "In which field did Napoleon excel during his time at the Royal Military School in Brienne?",
            answers: ["Literature", "Mathematics", "History"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "What event prompted Napoleon's move to mainland France?",
            answers: ["His marriage", "His father's death", "His mother's illness"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "In which year did the French Revolution begin?",
            answers: ["1776", "1789", "1799"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "What military skills did Napoleon demonstrate during the recapture of Toulon in 1793?",
            answers: ["Cavalry tactics", "Artillery skills", "Naval strategy"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "In what year did Napoleon receive a commission as a second lieutenant in the French army?",
            answers: ["1776", "1784", "1795"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "What was the political system established by Napoleon after the Coup of 18 Brumaire?",
            answers: ["Kingdom", "Republic", "Consulate"],
            correctAnswerIndex: 3
        ),
        QuizNapoleon(
            question: "During which campaign did Napoleon achieve stunning victories against Austrian forces?",
            answers: ["Russian Campaign", "Italian Campaign", "Egyptian Campaign"],
            correctAnswerIndex: 2
        ),
        QuizNapoleon(
            question: "What was Napoleon's title after the Coup of 18 Brumaire?",
            answers: ["President", "First Consul", "Emperor"],
            correctAnswerIndex: 2
        )
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundCustom")
        valueUI()
        valueConstraints()
        valueNavigationBar()
        valueUpdateForQuestion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = teamNames[currentTeamIndex]
        }

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonFirstAnswer.layer.cornerRadius = 30
        buttonSecondAnswer.layer.cornerRadius = 30
        buttonThirdAnswer.layer.cornerRadius = 30
        titleCard.layer.cornerRadius = 10
    }
    
    func navigateToResultViewController(score: Int) {
        if score == quiz.count {
            let winVC = WinQuizViewController()
            winVC.teamName = teamNames[currentTeamIndex]
            winVC.correctAnswersCount = self.correctAnswersCount
            winVC.score = score
            print("QuizGameViewController - correctAnswersCount: \(correctAnswersCount)")
            navigationController?.pushViewController(winVC, animated: true)
        } else {
            let loseVC = LoseQuizViewController()
            loseVC.teamName = teamNames[currentTeamIndex]
            loseVC.correctAnswersCount = self.correctAnswersCount
            loseVC.score = score
            print("QuizGameViewController - correctAnswersCount: \(correctAnswersCount)")
            navigationController?.pushViewController(loseVC, animated: true)
        }
    }
    
    func resetForNextTeam() {
        currentQuestionIndex = 0
        correctAnswersCount = 0 
        enableButtons()
        valueUpdateForQuestion()
    }

    private func enableButtons() {
        buttonFirstAnswer.isEnabled = true
        buttonSecondAnswer.isEnabled = true
        buttonThirdAnswer.isEnabled = true
        resetButtonColors()
    }
    
    private func valueUI() {
        buttonFirstAnswer.tag = 1
        buttonSecondAnswer.tag = 2
        buttonThirdAnswer.tag = 3
        
        titleCard.backgroundColor = UIColor(named: "buttonQuizCustom")
        titleCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleCard)
        
        let attributedText = NSMutableAttributedString(string: "1", attributes: [
            .font: UIFont(name: "Rubik-Medium", size: 16)!,
            .foregroundColor: UIColor.white
        ])
        attributedText.append(NSAttributedString(string: "/10", attributes: [
            .font: UIFont(name: "Rubik-Medium", size: 16)!,
            .foregroundColor: UIColor.white.withAlphaComponent(0.50)
        ]))
        
        titleAmount.attributedText = attributedText
        titleAmount.textColor = .white
        titleAmount.numberOfLines = 0
        titleAmount.textAlignment = .center
        titleAmount.font = UIFont(name: "NotoSans-SemiBold", size: 16)
        titleAmount.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleAmount)
        
        titleWord.text = "Word"
        titleWord.textColor = .white
        titleWord.numberOfLines = 0
        titleWord.textAlignment = .left
        titleWord.font = UIFont(name: "Rubik-Medium", size: 32)
        titleWord.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleWord)
        
        buttonFirstAnswer.setTitle("1 answer", for: .normal)
        buttonFirstAnswer.setTitleColor(.white, for: .normal)
        buttonFirstAnswer.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        buttonFirstAnswer.contentHorizontalAlignment = .center
        buttonFirstAnswer.layer.cornerRadius = 10
        buttonFirstAnswer.backgroundColor = UIColor(named: "buttonQuizCustom")
        buttonFirstAnswer.titleLabel?.numberOfLines = 0
        buttonFirstAnswer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonFirstAnswer)
        
        buttonSecondAnswer.setTitle("2 answer", for: .normal)
        buttonSecondAnswer.setTitleColor(.white, for: .normal)
        buttonSecondAnswer.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        buttonSecondAnswer.contentHorizontalAlignment = .center
        buttonSecondAnswer.layer.cornerRadius = 10
        buttonSecondAnswer.backgroundColor = UIColor(named: "buttonQuizCustom")
        buttonSecondAnswer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSecondAnswer)
        
        buttonThirdAnswer.setTitle("3 answer", for: .normal)
        buttonThirdAnswer.setTitleColor(.white, for: .normal)
        buttonThirdAnswer.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        buttonThirdAnswer.contentHorizontalAlignment = .center
        buttonThirdAnswer.layer.cornerRadius = 10
        buttonThirdAnswer.backgroundColor = UIColor(named: "buttonQuizCustom")
        buttonThirdAnswer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonThirdAnswer)
        
        buttonFirstAnswer.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        buttonSecondAnswer.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
        buttonThirdAnswer.addTarget(self, action: #selector(answerButtonTapped), for: .touchUpInside)
    }
    
    private func valueConstraints() {
        NSLayoutConstraint.activate([
            titleCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            titleCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleCard.widthAnchor.constraint(equalToConstant: 90),
            titleCard.heightAnchor.constraint(equalToConstant: 40),
            
            titleAmount.centerXAnchor.constraint(equalTo: titleCard.centerXAnchor),
            titleAmount.centerYAnchor.constraint(equalTo: titleCard.centerYAnchor),
            
            titleWord.topAnchor.constraint(equalTo: titleCard.bottomAnchor, constant: 24),
            titleWord.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleWord.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonFirstAnswer.bottomAnchor.constraint(equalTo: buttonSecondAnswer.topAnchor, constant: -16),
            buttonFirstAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonFirstAnswer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            buttonSecondAnswer.bottomAnchor.constraint(equalTo: buttonThirdAnswer.topAnchor, constant: -16),
            buttonSecondAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonSecondAnswer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            buttonThirdAnswer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47),
            buttonThirdAnswer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonThirdAnswer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                buttonFirstAnswer.heightAnchor.constraint(equalToConstant: 98),
                buttonSecondAnswer.heightAnchor.constraint(equalToConstant: 98),
                buttonThirdAnswer.heightAnchor.constraint(equalToConstant: 98),
            ])
        } else {
            NSLayoutConstraint.activate([
                buttonFirstAnswer.heightAnchor.constraint(equalToConstant: 58),
                buttonSecondAnswer.heightAnchor.constraint(equalToConstant: 58),
                buttonThirdAnswer.heightAnchor.constraint(equalToConstant: 58),
            ])
        }
    }
    
    private func valueNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let titleLabel = UILabel()
        titleLabel.text = teamNames[currentTeamIndex]
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Rubik-Medium", size: 24)
        navigationItem.titleView = titleLabel
        
        let closeButton = UIBarButtonItem(image: UIImage(named: "closeNav"), style: .plain, target: self, action: #selector(closeButton))
        closeButton.tintColor = .white
        navigationItem.leftBarButtonItem = closeButton
        
        let settingsButton = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsButton))
        settingsButton.tintColor = .white
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc private func closeButton() {
        print("close")
    }
    
    @objc private func settingsButton() {
        let settingsVC = SettingsViewController()
        let navigationController = UINavigationController(rootViewController: settingsVC)
        self.present(navigationController, animated: true)
    }
    
    private func valueUpdateForQuestion() {
        let currentQuestion = quiz[currentQuestionIndex]
        titleWord.text = currentQuestion.question
        buttonFirstAnswer.setTitle(currentQuestion.answers[0], for: .normal)
        buttonSecondAnswer.setTitle(currentQuestion.answers[1], for: .normal)
        buttonThirdAnswer.setTitle(currentQuestion.answers[2], for: .normal)
        
        // Обновление атрибутированного текста для titleAmount
        let attributedText = NSMutableAttributedString(string: "\(currentQuestionIndex + 1)", attributes: [
            .font: UIFont(name: "Rubik-Medium", size: 16)!,
            .foregroundColor: UIColor.white
        ])
        attributedText.append(NSAttributedString(string: "/\(quiz.count)", attributes: [
            .font: UIFont(name: "Rubik-Medium", size: 16)!,
            .foregroundColor: UIColor.gray
        ]))
        
        titleAmount.attributedText = attributedText
    }

    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        let correctAnswerIndex = quiz[currentQuestionIndex].correctAnswerIndex
        let isCorrectAnswer = sender.tag == correctAnswerIndex

        if isCorrectAnswer {
            correctAnswersCount += 1
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }

        disableButtons()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.currentQuestionIndex += 1
            if self.currentQuestionIndex < self.quiz.count {
                self.valueUpdateForQuestion()
                self.resetButtonColors()
            } else {
                self.navigateToResultViewController(score: self.correctAnswersCount)
                self.correctAnswersCount = 0
                self.currentQuestionIndex = 0
            }
        }
    }

    
    private func disableButtons() {
        buttonFirstAnswer.isEnabled = false
        buttonSecondAnswer.isEnabled = false
        buttonThirdAnswer.isEnabled = false
    }
    
    private func resetButtonColors() {
        buttonFirstAnswer.backgroundColor = UIColor(named: "buttonQuizCustom")
        buttonSecondAnswer.backgroundColor = UIColor(named: "buttonQuizCustom")
        buttonThirdAnswer.backgroundColor = UIColor(named: "buttonQuizCustom")
        
        buttonFirstAnswer.isEnabled = true
        buttonSecondAnswer.isEnabled = true
        buttonThirdAnswer.isEnabled = true
    }
}
