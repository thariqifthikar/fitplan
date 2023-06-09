//
//  WorkoutDetailModel.swift
//  fitplan
//
//  Created by user230748 on 5/15/23.
//

import Foundation

struct WorkoutDetailModel {
    let id: String
    let title:String
    let videoURL: String
    let thumbURL: URL?
    let description: String
    let setCount: Double
    let repCount: Double
    let bodyPart: String
    let bodyPartURL: URL?
    let weights: Bool
    let level: String
    let goal: String
}
