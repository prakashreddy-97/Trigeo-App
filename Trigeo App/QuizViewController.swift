//
//  QuizViewController.swift
//  Trigeo App
//
//  Created by Mahesh on 24/04/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var question1Label: UILabel!
    @IBOutlet weak var question1Button: UIButton!
    @IBOutlet weak var question2Label: UILabel!
    @IBOutlet weak var question2Buttin: UIButton!
    @IBOutlet weak var question3Label: UILabel!
    @IBOutlet weak var question3Button: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    var quizItems = [Quiz]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataFromServer()
    }
    
    func getDataFromServer() {
        self.getBackendless().persistenceService.of(Quiz.ofClass())?.find({ (list) in
            print(list)
            if let listItem = list as? [Quiz] {
                self.quizItems = listItem
            }
        }, error: { (error) in
            
        })
    }

    //MARK: Button Actions
    @IBAction func question1ButtonAction(_ sender: UIButton) {
        self.view1.backgroundColor = UIColor.green
        self.view2.backgroundColor = UIColor.white
        self.view3.backgroundColor = UIColor.white
        self.view4.backgroundColor = UIColor.white
        
        
    }
    
    @IBAction func question2ButtonAction(_ sender: UIButton) {
        self.view1.backgroundColor = UIColor.white
        self.view2.backgroundColor = UIColor.green
        self.view3.backgroundColor = UIColor.white
        self.view4.backgroundColor = UIColor.white
        
    }
    
    @IBAction func question3ButtonAction(_ sender: UIButton) {
        self.view1.backgroundColor = UIColor.white
        self.view2.backgroundColor = UIColor.white
        self.view3.backgroundColor = UIColor.green
        self.view4.backgroundColor = UIColor.white
        
    }
    @IBAction func question4Action(_ sender: UIButton) {
        self.view1.backgroundColor = UIColor.white
        self.view2.backgroundColor = UIColor.white
        self.view3.backgroundColor = UIColor.white
        self.view4.backgroundColor = UIColor.green
        
    }
}

