//
//  ItemModel.swift
//  studyTimer
//
//  Created by 64006562 on 4/20/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isComplated: Bool
}
