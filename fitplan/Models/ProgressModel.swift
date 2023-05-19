//
//  ProgressModel.swift
//  fitplan
//
//  Created by user230748 on 5/15/23.
//

import Foundation

struct ProgressModel {
    let id: String
    let workoutId: String
    let workoutTitle: String
    let workoutThumbURL: URL?
    let userId: String
    let sets: Int
    let reps: Int
    let timestamp: TimeInterval
}
