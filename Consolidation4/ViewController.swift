//
//  ViewController.swift
//  Consolidation4
//
//  Created by Roman on 3/7/20.
//  Copyright © 2020 Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK::variables
    var questionLabel:UILabel!
    var answerTextField:UITextField!
    var heartLabel:UILabel!
    var submitButton:UIButton!
    var lettersButtons = [UIButton]()
    var buttonsView: UIView!
    var answer = [String]()
    var question = [String]()
    
    var indexQuestionAndAnswer = 0
    var heart = 7{
        didSet{
            heartLabel.text = "❤️ \(heart)"
        }
    }
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        //MARK::adding heartLable
        heartLabel = UILabel()
        heartLabel.text = "❤️\(heart)"
        heartLabel.textAlignment = .right
        heartLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heartLabel)
       
        //MARK::adding quetionView
        let questionView = UIView()
        questionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionView)
        
        //MARK::adding questionLabel
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = "Some question"
        questionLabel.font = UIFont.systemFont(ofSize: 21)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        view.addSubview(questionLabel)
        
        //MARK::adding answerTextField
        answerTextField = UITextField()
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        answerTextField.textAlignment = .center
        answerTextField.placeholder = "?????"
        answerTextField.font = UIFont.systemFont(ofSize: 25)
        answerTextField.isUserInteractionEnabled = false
        view.addSubview(answerTextField)
        
        //MARK::adding submitButton
        submitButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("НАСТУПНЕ", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        
        submitButton.backgroundColor = .systemGray
        submitButton.tintColor = .white
        view.addSubview(submitButton)
        
        //MARK::buutonsView
        buttonsView = UIView()
        
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        //MARK::anchors
        NSLayoutConstraint.activate([
            heartLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 8),
            heartLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            questionView.topAnchor.constraint(equalTo: heartLabel.bottomAnchor),
            questionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            questionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            questionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                   
            questionLabel.centerYAnchor.constraint(equalTo: questionView.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: questionView.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: questionView.trailingAnchor),
            
            
            answerTextField.topAnchor.constraint(equalTo: questionView.bottomAnchor),
            answerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
            submitButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            submitButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            buttonsView.bottomAnchor.constraint(equalTo: submitButton.topAnchor,constant: -16),
            buttonsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            buttonsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            buttonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
            
            
        ])
        
        //MARK::adding buttons in buttonsView
        var topAnchor = buttonsView.topAnchor
        var leadingAnchor = buttonsView.leadingAnchor
        for _ in 0..<4{
            
        for _ in 0..<4{
           
            let button = UIButton(type: .system)
            button.setTitle("?", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.tintColor = .label
            button.translatesAutoresizingMaskIntoConstraints = false
            buttonsView.addSubview(button)
        
            button.topAnchor.constraint(equalTo: topAnchor).isActive = true
            button.widthAnchor.constraint(equalTo: buttonsView.widthAnchor, multiplier: 0.25).isActive = true
            button.heightAnchor.constraint(equalTo: buttonsView.heightAnchor, multiplier: 0.25).isActive = true
            button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
            lettersButtons.append(button)
            leadingAnchor = button.trailingAnchor
            
            }
            let endIndex = lettersButtons.endIndex - 1
            topAnchor = lettersButtons[endIndex].bottomAnchor
            leadingAnchor = buttonsView.leadingAnchor
        }
        
}
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataLevel()
        setupLabelsAndButtons()
       
        
    }

    
    //MARK::method loadDataLevel
    func loadDataLevel(){
       
        if let levelUrl = Bundle.main.url(forResource: "level1", withExtension: "txt"){
            if let levelContents = try? String(contentsOf: levelUrl){
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
                for line in lines{
                    if line != "" {
                        let parts = line.components(separatedBy: ": ")
                        let answer = parts[0]
                        let question = parts[1]
                    
                        self.answer.append(answer)
                        self.question.append(question)
                 
                    }
                }
                
            }
        }
    }

    //MARK::method setupLabelsAndButtons
    func setupLabelsAndButtons(){
        questionLabel.text = question[indexQuestionAndAnswer]
        answerTextField.placeholder = ""
        for _ in 0..<answer[indexQuestionAndAnswer].count{
            answerTextField.placeholder! += "?"
        }
        
        var letters = [String]()
        
        
        var ukrLetters = [String]()
        for i in "абвгґдеєжзиіїйклмнопрстуфхцчшщьюя"{
            ukrLetters.append(String(i))
        }
        ukrLetters.shuffle()
          for letter in answer[indexQuestionAndAnswer]{
                  if letters.contains(String(letter)) == false {
                      letters.append(String(letter))
                  }
        }
        
        
        var index = 0
        while letters.count != 16{
            
            if letters.contains(ukrLetters[index]) == false {
            letters.append(ukrLetters[index])
            }
            index += 1
        }
        
        
       
        letters.shuffle()
        if letters.count == lettersButtons.count{
        for i in 0..<letters.count{
            lettersButtons[i].setTitle(letters[i], for: .normal)
        }
        }
        
    }
    
}
