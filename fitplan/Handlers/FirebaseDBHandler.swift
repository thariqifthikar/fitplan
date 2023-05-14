//
//  FirebaseDatabase.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import Foundation
import FirebaseFirestore

final class FirebaseDBHandler{
    
    let shared = FirebaseDBHandler()
    let db = Firestore.firestore()
    
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
    
    
    
    //workouts management
    public func getWorkouts(
        completion: @escaping ([WorkoutModel])->Void
    ){
        //get all workouts code
        //TODO: adjust code to get only suitable workouts
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
    
    public func getUserProgress(
        userId:String,
        completion: @escaping ([ProgressModel])->Void
    ){
        //insert code to get all progress for user
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
