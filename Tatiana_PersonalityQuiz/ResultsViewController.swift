//
//  ResultsViewController.swift
//  Tatiana_PersonalityQuiz
//
//  Created by Tatiana Pope on 5/3/21.
//

import UIKit

class ResultsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    
    init?(coder: NSCoder, responses: [Answer]) {
    self.responses = responses
        super.init(coder: coder) }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    var responses: [Answer]

    func calculatePersonalityResult() {
            let frequencyOfAnswers = responses.reduce(into: [AnimalType: Int]()) { (counts, answer) in
                if let existingCount = counts[answer.type] { counts[answer.type] = existingCount + 1 }
                else { counts[answer.type] = 1 } }
            let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) in return pair1.value > pair2.value })
            let mostCommonAnswer = frequentAnswersSorted.first!.key
            resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
            resultDefinitionLabel.text = mostCommonAnswer.definition
     
        }

    

    
    
    

}
