//
//  ViewController.swift
//  Consolidation4
//
//  Created by Roman on 3/7/20.
//  Copyright © 2020 Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var questionLabel:UILabel!
    var answerLabel:UITextField!
    var heartLabel:UILabel!
    var heart = 7{
        didSet{
            heartLabel.text = "❤️ \(heart)"
        }
    }
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        heartLabel = UILabel()
        heartLabel.text = "❤️\(heart)"
        heartLabel.textAlignment = .right
        heartLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heartLabel)
       
        
        
        
        
        NSLayoutConstraint.activate([
            heartLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                   heartLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
                   
        ])
       
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }


}
