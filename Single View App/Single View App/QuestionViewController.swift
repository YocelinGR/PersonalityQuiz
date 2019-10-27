//
//  QuestionViewController.swift
//  Single View App
//
//  Created by Apple Device 7 on 10/19/19.
//  Copyright © 2019 PersonalityQuiz-ECC. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleQuestion1: UIButton!
    @IBOutlet weak var singleQuestion2: UIButton!
    @IBOutlet weak var singleQuestion3: UIButton!
    @IBOutlet weak var singleQuestion4: UIButton!
    // Multiple stack
    
    @IBOutlet weak var multipleQuestionLabel1: UILabel!
    @IBOutlet weak var multipleQuestionSwitch1: UISwitch!
    @IBOutlet weak var multipleQuestionLabel2: UILabel!
    @IBOutlet weak var multipleQuestionSwitch2: UISwitch!
    @IBOutlet weak var multipleStackViewLabel3: UILabel!
    @IBOutlet weak var multipleStackViewSwitch3: UISwitch!
    @IBOutlet weak var multipleStackViewLabel4: UILabel!
    @IBOutlet weak var multipleStackViewSwitch4: UISwitch!
    @IBOutlet weak var multipleStackViewLabel5: UILabel!
    @IBOutlet weak var multipleStackViewSwitch5: UISwitch!
    @IBOutlet weak var multipleStackViewLabel6: UILabel!
    @IBOutlet weak var multipleStackViewSwitch6: UISwitch!
    @IBOutlet weak var rangedStackLabel1: UILabel!
    @IBOutlet weak var rangedStackViewLabel2: UILabel!
    @IBOutlet weak var rangedStackViewSlider: UISlider!
    @IBOutlet weak var progressView: UIProgressView!
    
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        switch questionIndex {
        case 0:
            singleStackView.isHidden = false
            multipleStackView.isHidden = true
            rangedStackView.isHidden = true
        case 1:
            singleStackView.isHidden = true
            multipleStackView.isHidden = false
            rangedStackView.isHidden = true
        case 2:
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = false
        default:
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = true
        }
        questionLabel.text = questions[questionIndex].text
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    var questionOne = Question(text: "Cual es tu actividad favorita?", type: .single, answer: [Answer(text:"Leer un libro", type:.Bella), Answer(text:"Cocinar", type:.Tiana),Answer(text:"Nadar", type:.Ariel), Answer(text:"Artes marciales", type:.Mulan)])
    

    var questionTwo = Question(text: "Animal que dirige mi desfile", type: .single, answer: [Answer(text:"Pez", type:.Ariel), Answer(text:"Cocodrilo", type:.Tiana),Answer(text:"Dragon", type:.Mulan), Answer(text:"Caballo", type:.Bella)])
    
    var questionThree = Question(text: "Cualidad de un principe", type: .multiple, answer: [Answer(text:"No necesito un principe", type:.Tiana), Answer(text:"Encantador", type:.Ariel),Answer(text:"Inteligente", type:.Bella), Answer(text:"Honorable", type:.Mulan), Answer(text:"Amable", type:.Ariel)])
    
    var questionFour = Question(text: "Que tan dulce te consideras?", type: .ranged, answer: [Answer(text:"Nada dulce", type:.Mulan), Answer(text:"Poco dulce", type:.Tiana),Answer(text:"Dulce", type:.Bella), Answer(text:"Muy dulce", type:.Ariel)])
    
    var questions = [questionOne, questionTwo, questionThree, questionFour]
        
    var questionIndex = 0
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
