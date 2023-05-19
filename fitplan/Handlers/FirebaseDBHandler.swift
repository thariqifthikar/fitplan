//
//  FirebaseDatabase.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import Foundation
import FirebaseFirestore

final class FirebaseDBHandler{
    
    static let shared = FirebaseDBHandler()
    private let db = Firestore.firestore()
    
    init(){}
    
    //user management
    public func addUser(
        user:UserModel,
        completion: @escaping (Bool)->Void
    ){
        //insert code to add user
    }
    
    public func addUserdetails(
        user:UserModel,
        completion: @escaping (Bool)->Void
    ){
        //code to update user (with details map filled)
    }
    
    public func updateUserDetails(
        firstName: String,
        lastName: String,
        completion: @escaping (Bool)->Void
    ){
        if(firstName.isEmpty || lastName.isEmpty){
            completion(false)
            return
        }
        
        //insert code to update user
    }
    
    func userHasDetails() -> Bool {
        let result = true
        
        return result
    }
    
    
    
    //workouts management
    public func getWorkouts(
        level: String,
        equipment: Bool,
        goal: String,
        completion: @escaping ([WorkoutDetailModel])->Void
    ){
        let collection = db.collection("Workouts")
        
        collection.whereField("level", isEqualTo: level)
            .whereField("equipment", isEqualTo: equipment)
            .whereField("goal", isEqualTo: goal)
            .getDocuments { (snapshot, error) in
                
                guard let snapshot = snapshot, error == nil else{
                    print(error?.localizedDescription ?? "")
                    completion([])
                    return
                }
                
                var workouts: [WorkoutDetailModel] = []
                for doc in snapshot.documents {
                    let data = doc.data()
                    let id = doc.documentID
                    
                    guard let title = data["title"] as? String,
                          let videoURL = data["videoURL"] as? String,
                          let thumbURLString = data["thumbURL"] as? String,
                          let thumbURL = URL(string: thumbURLString),
                          let description = data["description"] as? String,
                          let setCount = data["sets"] as? Double,
                          let repCount = data["reps"] as? Double,
                          let bodyPart = data["bodyPart"] as? String,
                          let bodyPartURLString = data["bodyPartURL"] as? String,
                          let bodyPartURL = URL(string: bodyPartURLString),
                          let weights = data["equipment"] as? Bool,
                          let level = data["level"] as? String,
                          let goal = data["goal"] as? String else {
                        print("Failed to parse workout data for document with ID: \(doc.documentID)")
                        continue
                    }
                    
                    workouts.append(WorkoutDetailModel(
                        id: id,
                        title: title,
                        videoURL: videoURL,
                        thumbURL: thumbURL,
                        description: description,
                        setCount: setCount,
                        repCount: repCount,
                        bodyPart: bodyPart,
                        bodyPartURL: bodyPartURL,
                        weights: weights,
                        level: level,
                        goal: goal))
                }
                
                completion(workouts)
                
            }
    }
    
    public func getWorkoutDetails(
        workoutId: String,
        completion: @escaping (WorkoutDetailModel)->Void
    ){
        //insert code to get workout details
    }
    
    
    
    //custom schedules management
    public func getUserSchedules(
        userId: String,
        completion: @escaping ([ScheduleModel])->Void
    ){
        //insert code to get all schedules for specific user
    }
    
    public func getWorkoutSchedule(
        userId: String,
        workoutId: String,
        completion: @escaping (ScheduleModel)->Void
    ){
        //insert code to get schedule for workout
    }
    
    public func addSchedule(
        schedule: ScheduleModel,
        completion: @escaping (Bool)->Void
    ){
        if(schedule.workoutId.isEmpty || schedule.selectedDays.isEmpty || schedule.selectedTime.isZero){
            completion(false)
            return
        }
        
        //insert data to add schedule
    }
    
    public func removeSchedule(
        schedule: ScheduleModel,
        completion: @escaping (Bool)->Void
    ){
        //insert code to remove schedules
    }
    
    public func updateSchedule(
        schedule: ScheduleModel,
        completion: @escaping (Bool)->Void
    ){
        //insert data to update schedule
    }
    
    
    
    //progress management
    public func addProgress(
        progress: ProgressModel,
        completion: @escaping (Bool)->Void
    ){
        //insert code to add progress
    }
    
    public func getProgresses(
        userid: String,
        completion: @escaping ([ProgressModel])->Void
    ){
        let collection = db.collection("Progress")
        
        collection.whereField("userid", isEqualTo: userid)
            .getDocuments { (snapshot, error) in
                
                guard let snapshot = snapshot, error == nil else{
                    print(error?.localizedDescription ?? "")
                    completion([])
                    return
                }
                
                var progressArray: [ProgressModel] = []
                for doc in snapshot.documents {
                    let data = doc.data()
                    let id = doc.documentID
                    
                    guard let workoutTitle = data["workoutTitle"] as? String,
                          let workoutThumbURLString = data["workoutThumbURL"] as? String,
                          let workoutThumbURL = URL(string: workoutThumbURLString),
                          let workoutId = data["workoutId"] as? String,
                          let userid = data["userid"] as? String,
                          let sets = data["sets"] as? Int,
                          let reps = data["reps"] as? Int,
                          let timestamp = data["timestamp"] as? TimeInterval else {
                        print("Failed to parse workout data for document with ID: \(doc.documentID)")
                        continue
                    }
                    
                    progressArray.append(ProgressModel(
                        id: id,
                        workoutId: workoutId,
                        workoutTitle: workoutTitle,
                        workoutThumbURL: workoutThumbURL,
                        userId: userid,
                        sets: sets,
                        reps: reps,
                        timestamp: timestamp))
                }
                
                completion(progressArray)
                
            }
    }
    
    public func getWorkoutProgress(
        userId: String,
        workoutId: String,
        completion: @escaping ([ProgressModel])->Void
    ){
        //insert code to get progress by user and workout
    }
    
    public func removeProgress (
        progress: ProgressModel,
        completion: @escaping (Bool)->Void
    ){
        //remove progress
    }
    
    public func updateProgress(
        progress:ProgressModel,
        completion: @escaping (Bool)->Void
    ){
        //update progress
    }
}
