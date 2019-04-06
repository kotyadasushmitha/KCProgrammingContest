//
//  NewSchoolViewController.swift
//  KCProgrammingContest
//
//  Created by Kotyada,Durga Susmitha on 3/13/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import UIKit

class NewSchoolViewController: UIViewController {
    
   @IBOutlet weak var schoolNameTF: UITextField!
    @IBOutlet weak var coachNameTF: UITextField!
    
    var addNewSchool: School!

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
    

    @IBAction func done(_ sender: Any) {
        let schoolName = schoolNameTF.text!
        let coachName = coachNameTF.text!
        
       // Schools.shared.add(school: School(name: schoolName, coach: coachName))
        Schools.shared.saveSchool(name: schoolName, coach: coachName)
        print(schoolName)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
