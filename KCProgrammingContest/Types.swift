//
//  Types.swift
//  KCProgrammingContest
//
//  Created by Kotyada,Durga Susmitha on 3/13/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import Foundation

class Schools{
    
    private var schools:[School]
    static var shared = Schools()
    
    init(schools:[School]) {
        self.schools = schools
    }
    
    convenience init(){
        self.init(schools: [])
    }
    
    
    
    func numSchools() -> Int{
        return schools.count
    }
    func add(school:School){
        schools.append(school)
    }
    subscript(index:Int) -> School{
        return schools[index]
    }
    func delete(school:School){
        for i in 0 ..< schools.count{
            if schools[i] == school{
                schools.remove(at: i)
                break
            }
        }
    }
}

class School : Equatable{
    var name:String
    var coach:String
    var teams:[Team]
    
    init(name:String, coach:String){
        self.name = name
        self.coach = coach
        self.teams = []
    }
    
    static func == (lhs:School, rhs:School) -> Bool{
        return lhs.name == rhs.name && lhs.coach == rhs.coach && lhs.teams == rhs.teams
    }
    
    func addTeam(name:String, students:[String]){
        teams.append(Team(name: name, students: students))
    }
    
    
}

class Team : Equatable{
    var name:String
    var students:[String]
    
    init(name:String, students:[String]){
        self.name = name
        self.students = students
    }
    
    static func == (lhs:Team, rhs:Team) -> Bool{
        return lhs.name == rhs.name && lhs.students == rhs.students
    }
    
}
