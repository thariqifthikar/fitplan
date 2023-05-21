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
        user: [String:Any],
        userid:String,
        completion: @escaping (Bool) -> Void
    ) {
        
        db.collection("Users").document(userid).setData(user) { error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func addUserdetails(
        user: [String:Any],
        userid: String,
        completion: @escaping (Bool) -> Void
    ) {
        
        db.collection("Users").document(userid).updateData(user) { error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func updateUserDetails(
        user: [String:Any],
        userid: String,
        completion: @escaping (Bool)->Void
    ){
        db.collection("Users").document(userid).updateData(user) { error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func userHasDetails(
        userid: String,
        completion: @escaping (Bool) -> Void
    ) {
        let collection = db.collection("Users")
        
        collection.whereField("userid", isEqualTo: userid)
            .getDocuments { (snapshot, error) in
                
                guard let snapshot = snapshot, error == nil else{
                    print(error?.localizedDescription ?? "")
                    completion(false)
                    return
                }
                
                guard let data = snapshot.documents[0].data() else {
                    completion(false)
                    return
                }
                
                guard let _ = data["height"] as? Float,
                      let _ = data["weight"] as? Float,
                      let _ = data["equipment"] as? Bool,
                      let _ = data["goal"] as? String,
                      let _ = data["level"] as? String else {
                    print("No needed data for document with ID: \(snapshot.documents[0].documentID)")
                    completion(false)
                    return
                }
                
                completion(true)
                
            }
        
        
    }
    
    public func setUserDetails(
        userid: String,
        completion: @escaping (Bool) -> Void
    ) {
        let collection = db.collection("Users")
        
        collection.whereField("userid", isEqualTo: userid)
            .getDocuments { (snapshot, error) in
                
                guard let snapshot = snapshot, error == nil else{
                    print(error?.localizedDescription ?? "")
                    completion(false)
                    return
                }
                
                let data = snapshot.documents[0].data()
                
                guard let goal = data["goal"] as? Float,
                      let level = data["level"] as? Float,
                      let equipment = data["equipment"] as? Bool else {
                    print("No needed data for document with ID: \(snapshot.documents[0].documentID)")
                    completion(false)
                    return
                }
                
                UserDefaults.standard.set(goal, forKey: "goal")
                UserDefaults.standard.set(level, forKey: "level")
                UserDefaults.standard.set(equipment, forKey: "equipment")
                
                completion(true)
                
            }
        
        
    }
    
    
    
    //workouts management
    public func getWorkout(
        workoutId: String,
        completion: @escaping (Bool, WorkoutDetailModel)->Void
    ){
        let collection = db.collection("Workouts")
        
        collection.document(workoutId).getDocument { (snapshot, error) in
            
            guard let snapshot = snapshot, error == nil, let data = snapshot.data() else{
                print(error?.localizedDescription ?? "")
                
                completion(false, WorkoutDetailModel(
                    id: "",
                    title: "",
                    videoURL: "",
                    thumbURL: nil,
                    description: "",
                    setCount: 0.0,
                    repCount: 0.0,
                    bodyPart: "",
                    bodyPartURL: nil,
                    weights: false,
                    level: "",
                    goal: "")
                )
                return
            }
            
            let id = snapshot.documentID
            
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
                print("Failed to parse workout data for document with ID: \(id)")
                return
            }
            
            let workout = WorkoutDetailModel(
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
                goal: goal
            )
            
            completion(true,workout)
            
        }
    }
    
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
    
    public func getWorkoutProgresses(
        level: String,
        equipment: Bool,
        goal: String,
        completion: @escaping ([WorkoutProgressModel])->Void
    ){
        var workoutProgresses: [WorkoutProgressModel] = []
        
        getWorkouts(level: level, equipment: equipment, goal: goal){ [weak self] workouts in
            
            let dispatchGroup = DispatchGroup()
            
            for workout in workouts {
                dispatchGroup.enter()
                let id = workout.id
                let title = workout.title
                let thumbURL = workout.thumbURL
                let setCount = workout.setCount
                let repCount = workout.repCount
                print("workouts in getworkoutprogress: \(workouts.count)")
                guard let userid = AuthHandler.shared.auth.currentUser?.uid else {
                    print("error getting userid")
                    dispatchGroup.leave()
                    completion([])
                    return
                }
                
                var progresses: [ProgressModel] = []
                
                self?.getProgresses(userid: userid, workoutId: workout.id){ progress in
                    
                    progresses.append(contentsOf: progress)
                    dispatchGroup.leave()
                    print("ran round for progreses, size: \(progresses.count)")
                }
                
                print("came to create wp Model")
                
                dispatchGroup.notify(queue: .main){
                    workoutProgresses.append(
                        WorkoutProgressModel(
                            id: id,
                            title: title,
                            thumbURL: thumbURL,
                            setCount: setCount,
                            repCount: repCount,
                            progresses: progresses
                        )
                    )
                    
                    print("added wp item: \(workoutProgresses)")
                }
                
                
                
            }
            
            dispatchGroup.notify(queue: .main){
                completion(workoutProgresses)
            }
        }
    }
    
    //custom schedules management
    public func getUserSchedules(
        userid: String,
        completion: @escaping ([ScheduleModel])->Void
    ){
        let collection = db.collection("Schedules")
        
        collection.whereField("userid", isEqualTo: userid)
            .getDocuments { (snapshot, error) in
                
                guard let snapshot = snapshot, error == nil else{
                    print(error?.localizedDescription ?? "")
                    completion([])
                    return
                }
                
                var schedules: [ScheduleModel] = []
                for doc in snapshot.documents {
                    let data = doc.data()
                    let id = doc.documentID
                    
                    guard let workoutTitle = data["workoutTitle"] as? String,
                          let workoutId = data["workoutId"] as? String,
                          let workoutThumbURLString = data["workoutThumbURL"] as? String,
                          let workoutThumbURL = URL(string: workoutThumbURLString),
                          let userid = data["userid"] as? String,
                          let time = data["time"] as? TimeInterval,
                          let days = data["days"] as? [String] else {
                        print("no schedule data for document with ID: \(doc.documentID)")
                        continue
                    }
                    
                    schedules.append(ScheduleModel(
                        id: id,
                        selectedDays: days,
                        selectedTime: time,
                        workoutId: workoutId,
                        workoutTitle: workoutTitle,
                        workoutThumbURL: workoutThumbURL,
                        userid: userid)
                    )
                }
                
                completion(schedules)
                
            }
    }
    
    public func addSchedule(
        schedule: ScheduleModel,
        completion: @escaping (Bool) -> Void
    ) {
        
        let data: [String:Any] = [
            "days": schedule.selectedDays,
            "time": schedule.selectedTime,
            "userid": schedule.id,
            "workoutId": schedule.workoutId,
            "workoutThumbURL": schedule.workoutThumbURL?.absoluteString ?? "",
            "workoutTitle": schedule.workoutTitle
        ]
        
        db.collection("Schedules").addDocument(data: data) { error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func removeSchedule(
        scheduleId: String,
        completion: @escaping (Bool)->Void
    ){
        db.collection("Schedule").document(scheduleId).delete { error in
            guard error == nil else {
                print("couldnt delete: \(error?.localizedDescription ?? "")")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func updateSchedule(
        schedule: [String:Any],
        scheduleId: String,
        completion: @escaping (Bool)->Void
    ){
        db.collection("Schedule").document(scheduleId).updateData(schedule) { error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    
    
    //progress management
    public func addProgress(
        progress: ProgressModel,
        completion: @escaping (Bool) -> Void
    ) {
        
        let data: [String:Any] = [
            "reps": progress.reps,
            "sets": progress.sets,
            "timestamp": Date(),
            "workoutId": progress.workoutId,
            "workoutThumbURL": progress.workoutThumbURL?.absoluteString ?? "",
            "workoutTitle": progress.workoutTitle,
            "userid": progress.userId
        ]
        
        db.collection("Progress").addDocument(data: data) { error in
            
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func getProgresses(
        userid: String,
        workoutId: String,
        completion: @escaping ([ProgressModel])->Void
    ){
        let collection = db.collection("Progress")
        
        collection.whereField("userid", isEqualTo: userid)
            .whereField("workoutId", isEqualTo: workoutId)
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
                          let sets = data["sets"] as? Double,
                          let reps = data["reps"] as? Double,
                          let timestamp = data["timestamp"] as? Timestamp else {
                        print("Failed to parse workout data for document with ID: \(doc.documentID)")
                        continue
                    }
                    
                    progressArray.append(ProgressModel(
                        id: id,
                        workoutId: workoutId,
                        workoutTitle: workoutTitle,
                        workoutThumbURL: workoutThumbURL,
                        userId: userid,
                        sets: Int(sets),
                        reps: Int(reps),
                        timestamp: timestamp.dateValue().timeIntervalSince1970))
                }
                
                completion(progressArray)
                
            }
    }
    
    public func removeProgress (
        progressId: String,
        completion: @escaping (Bool)->Void
    ){
        db.collection("Progress").document(progressId).delete { error in
            guard error == nil else {
                print("couldnt delete: \(error?.localizedDescription ?? "")")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
}
