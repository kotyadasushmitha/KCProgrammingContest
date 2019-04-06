//
//  Types.swift
//  KCProgrammingContest
//
//  Created by Kotyada,Durga Susmitha on 3/13/19.
//  Copyright © 2019 Kotyada,Durga Susmitha. All rights reserved.
//

import Foundation

class Schools{
    
    let backendless = Backendless.sharedInstance()!
    var schoolsDataStore:IDataStore!
    var teamsDataStore:IDataStore!
    
    var schools:[School]
    var teams:[Team]
    static var shared = Schools()
    
    var teamsForSelectedSchool:[Team] = []
    init(schools:[School]) {
        self.schools = schools
        self.teams = []
        schoolsDataStore = backendless.data.of(School.self)                  // our connections to Backendless tables
        teamsDataStore = backendless.data.of(Team.self)
    }
    
    private init() {
        self.schools = []
        self.teams = []
        schoolsDataStore = backendless.data.of(School.self)                  // our connections to Backendless tables
        teamsDataStore = backendless.data.of(Team.self)
    }
  
    
    
    func numSchools() -> Int{
        return schools.count
    }
    
    func numTeams() -> Int{
        return teams.count
    }
    func numTeamsForSelectedSchool() -> Int {
        return teamsForSelectedSchool.count
    }
    func add(school:School){
        schools.append(school)
    }
    subscript(index:Int) -> School{
        return schools[index]
    }
    func saveSchool(name:String, coach:String) {
        
        //
        var schoolToSave = School(name: name, coach: coach, teams: [])
        schoolToSave = schoolsDataStore.save(schoolToSave) as! School
        schools.append(schoolToSave)
        
        //
    }
    func saveTeamForSelectedSchool(school: School, team: Team) {
        print("Saving the team for the selected school...")
        Types.tryblock({
            let savedTeam = self.teamsDataStore.save(team) as! Team
            self.schoolsDataStore.addRelation("team:Team:n", parentObjectId: school.objectId, childObjects: [savedTeam.objectId!])
            
        }, catchblock:{ (exception) -> Void in
            print(exception.debugDescription)
        })
        school.teams.append(team)
        print("Done!! ")
    }
    
    func retrieveAllSchools() {
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setRelated(["teams"])
        queryBuilder!.setPageSize(100)
        Types.tryblock({() -> Void in
            self.schools = self.schoolsDataStore.find(queryBuilder) as! [School]
            
        },
       catchblock: {(fault) -> Void in print(fault ?? "Something has gone wrong when retrievingAllTouristSites()")})
        
    }
    
    func retrieveTeamsForSelectedSchool(school: School) {
        
        Types.tryblock( {
            let queryBuilder:DataQueryBuilder = DataQueryBuilder()
            queryBuilder.setWhereClause("name = '\(school.name! )'" )
            queryBuilder.setPageSize(100)
            queryBuilder.setRelated( ["team"] )
            let result = self.schoolsDataStore.find(queryBuilder) as! [School]
            self.teamsForSelectedSchool = result[0].teams
            
        },
                        catchblock: {(exception) -> Void in
                            print("Oopsie retrieving team for selected school -- \(exception.debugDescription)")
        })
       
    }
    func deleteTeam(school:School, team:Team){
        for i in 0 ..< teams.count{
            if school.teams[i] == team{
                teamsDataStore.remove(team)
            }
        }
    }
    func deleteSchool(school:School){
        schoolsDataStore.remove(school)
        for i in 0 ..< schools.count{
            if schools[i] == school{
                schools.remove(at: i)
                break
            }
        }
    }
}

@objcMembers
class School : NSObject{
    var name:String?
    var coach:String
    var teams:[Team]
    
    override var description: String { // NSObject adheres to the CustomStringConvertible protocol
        return "Name: \(name ?? ""), Coach: \(coach), ObjectId: \(objectId ?? "N/A")"
    }
    var objectId:String?
    
    init(name:String, coach:String, teams: [Team]){
        self.name = name
        self.coach = coach
        self.teams = teams
    }
    
    static func == (lhs:School, rhs:School) -> Bool{
        return lhs.name == rhs.name && lhs.coach == rhs.coach && lhs.teams == rhs.teams
    }
    
    func addTeam(name:String, students:[String]){
        teams.append(Team(name: name, students: students))
    }
    
    convenience override init(){
        self.init(name:"", coach:"", teams:[])
    }
}

@objcMembers
class Team : NSObject{
    var name:String?
    var students:[String]
    
    override var description: String { // NSObject adheres to the CustomStringConvertible protocol
        return "Name: \(name ?? ""), Students: \(students)"
    }
    var objectId:String?
    
    init(name:String, students:[String]){
        self.name = name
        self.students = students
    }
    
    static func == (lhs:Team, rhs:Team) -> Bool{
        return lhs.name == rhs.name && lhs.students == rhs.students
    }
    
    convenience override init(){
        self.init(name:"", students:[])
    }
    
}
