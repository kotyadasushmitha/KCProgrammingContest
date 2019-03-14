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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func done(_ sender: Any) {
        let teamName = teamNameTF.text!
        let student0 = student0TF.text!
        let student1 = student1TF.text!
        let student2 = student2TF.text!
        
        school.addTeam(name: teamName, students: [student0, student1, student2])
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
