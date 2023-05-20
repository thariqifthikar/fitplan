//
//  ScheduleModel.swift
//  fitplan
//
//  Created by user230748 on 5/15/23.
//

import Foundation

struct ScheduleModel {
    let id: String
    let selectedDays: [String]
    let selectedTime: TimeInterval
    let workoutId: String
    let workoutTitle: String
    let workoutThumbURL: URL?
    let userid: String
}
