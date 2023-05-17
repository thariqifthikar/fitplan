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
    let videoURL: URL
    let thumbURL: URL
    let description: String
    let setCount: Int
    let repCount: Int
    let time: Int
    let bodyPart: String
    let bodyPartURL: URL
    let weights: Bool
}
