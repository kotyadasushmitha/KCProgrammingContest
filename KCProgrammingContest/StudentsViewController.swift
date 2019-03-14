//
//  StudentsViewController.swift
//  KCProgrammingContest
//
//  Created by Kotyada,Durga Susmitha on 3/13/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {
    
    @IBOutlet weak var student0LBL:UILabel!
    @IBOutlet weak var student1LBL:UILabel!
    @IBOutlet weak var student2LBL:UILabel!

    var team:Team!
    override func viewDidLoad() {
        super.viewDidLoad()
     student0LBL.text = team.students[0]
        student1LBL.text = team.students[1]
        student2LBL.text = team.students[2]
        navigationItem.title = team.name
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
