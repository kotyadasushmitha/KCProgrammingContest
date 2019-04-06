//
//  NewTeamViewController.swift
//  KCProgrammingContest
//
//  Created by Kotyada,Durga Susmitha on 3/13/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import UIKit

class NewTeamViewController: UIViewController {
    
    
    @IBOutlet weak var teamNameTF: UITextField!
    
    @IBOutlet weak var student0TF: UITextField!
    
    @IBOutlet weak var student1TF: UITextField!
    
    @IBOutlet weak var student2TF: UITextField!
    
    var school: School!
    
    
    

    @IBAction func done(_ sender: Any) {
        let teamName = teamNameTF.text!
        let student0 = student0TF.text!
        let student1 = student1TF.text!
        let student2 = student2TF.text!
        
        
        self.dismiss(animated: true, completion: nil)
        if teamNameTF.text!.count != 0 && student0TF.text!.count != 0 && student1TF.text!.count != 0 && student2TF.text!.count != 0 {
            Schools.shared.saveTeamForSelectedSchool(school: school, team: Team(name: teamName, students: [student0, student1, student2]))
            self.dismiss(animated: true, completion: nil)
            
        } else if teamNameTF.text!.count != 0 {
            displayMessage(fieldName: "Name")
            
        } else if student0TF.text!.count != 0 {
            displayMessage(fieldName: "Student 0")
            
        } else if student1TF.text!.count != 0 {
            displayMessage(fieldName: "Student 1")
            
        } else if student2TF.text!.count != 0 {
            displayMessage(fieldName: "Student 2")
            
        }
        
    }
    
    func displayMessage(fieldName: String){
        
        let alert = UIAlertController(title: "Note",
                                      
                                      message: "Please enter a value in \(fieldName) text field.",
            
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default,
                                      
                                      handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
