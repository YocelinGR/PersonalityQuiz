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
            updateSingleStack(answer: questions[questionIndex].answer)
        case 1:
            singleStackView.isHidden = true
            multipleStackView.isHidden = false
            rangedStackView.isHidden = true
            updateMultipleStack(answer: questions[questionIndex].answer)
        case 2:
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = false
        default:
            singleStackView.isHidden = true
            multipleStackView.isHidden = true
            rangedStackView.isHidden = true
            updateRangedStack(answer: questions[questionIndex].answer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    var questionOne = Question(text: "Cual es tu actividad favorita?", type: .single, answers: [Answer(text:"Leer un libro", type:.Bella), Answer(text:"Cocinar", type:.Tiana),Answer(text:"Nadar", type:.Ariel), Answer(text:"Artes marciales", type:.Mulan)])
    var questionTwo = Question(text: "Animal que dirige mi desfile", type: .single, answers: [Answer(text:"Pez", type:.Ariel), Answer(text:"Cocodrilo", type:.Tiana),Answer(text:"Dragon", type:.Mulan), Answer(text:"Caballo", type:.Bella)])
    var questionThree = Question(text: "Cualidad de un principe", type: .multiple, answers: [Answer(text:"No necesito un principe", type:.Tiana), Answer(text:"Encantador", type:.Ariel),Answer(text:"Inteligente", type:.Bella), Answer(text:"Honorable", type:.Mulan), Answer(text:"Amable", type:.Ariel)])
    var questionFour = Question(text: "Que tan dulce te consideras?", type: .ranged, answers: [Answer(text:"Nada dulce", type:.Mulan), Answer(text:"Poco dulce", type:.Tiana),Answer(text:"Dulce", type:.Bella), Answer(text:"Muy dulce", type:.Ariel)])
    var questions = [questionOne, questionThree, questionFour]
    var questionIndex = 0

    questionLabel.text = questions[questionIndex].text
    let totalProgress = Float(questionIndex) / Float(questions.count)
    progressView.setProgress(totalProgress, animated: true)

    let currentAnswers = questions[questionIndex].answer

    func updateSingleStack(using answer: [Answer]) {
        singleStackView.isHidden = false
        singleQuestion1.setTitle(answers[0].text, for: .normal)
        singleQuestion2.setTitle(answers[1].text, for: .normal)
        singleQuestion3.setTitle(answers[2].text, for: .normal)
        singleQuestion4.setTitle(answers[3].text, for: .normal)
    }

    func updateMultipleStack(using answer: [Answer]) {
        multipleStackView.isHidden = false
		multipleQuestionSwitch1.isOn = false
        multipleQuestionSwitch2.isOn = false
        multipleQuestionSwitch3.isOn = false
        multipleQuestionSwitch4.isOn = false
        multipleQuestionLabel1.text = answers[0].text
        multipleQuestionLabel2.text = answers[1].text
        multipleQuestionLabel3.text = answers[2].text
        multipleQuestionLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
			  rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }

    var answersChosen: [Answer] = []

    @IBAction func singleAnswerButtonClicked(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleQuestion1:
            answersChosen.append(currentAnswers[0])
        case singleQuestion2:
            answersChosen.append(currentAnswers[1])
        case singleQuestion3:
            answersChosen.append(currentAnswers[2])
        case singleQuestion4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }

    @IBAction func multipleAnswerButtonClicked(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        if multipleQuestionSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multipleQuestionSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multipleQuestionSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multipleQuestionSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }

    @IBAction func rangedAnswerButtonClicked(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedStackViewSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }

    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
