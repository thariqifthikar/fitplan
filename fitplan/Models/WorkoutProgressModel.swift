//
//  WorkoutProgressModel.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import Foundation

struct WorkoutProgressModel {
    let id: String
    let title:String
    let thumbURL: URL?
    let setCount: Double
    let repCount: Double
    let progresses: [ProgressModel]
}
