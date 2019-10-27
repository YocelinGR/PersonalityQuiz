//
//  ResultsViewController.swift
//  Single View App
//
//  Created by Apple Device 7 on 10/19/19.
//  Copyright © 2019 PersonalityQuiz-ECC. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!

    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [Type: Int] = [:]
        let responsesType = responses.map { $0.type }
        for response in responsesType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1}.first!.key
        resultAnswerLabel.text = "You should visit \(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
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
