//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var yourResult: UILabel!
    @IBOutlet weak var descriptionResult: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        calculateResults ()
    }
    
    private func calculateResults () {
        var answers: [AnimalType: Int] = [:]
        
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            answers[response] = (answers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = answers.sorted(by:
                                                    { (pairOne, pairSecond) -> Bool in return
                                                        pairOne.value > pairSecond.value })
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        yourResult.text = "Вы - \(mostCommonAnswer.rawValue)"
        descriptionResult.text = mostCommonAnswer.definition
    }
    
}
