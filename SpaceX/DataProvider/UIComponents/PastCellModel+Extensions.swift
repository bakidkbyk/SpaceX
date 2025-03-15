//
//  PastCellModel+Extensions.swift
//  SpaceX
//
//  Created by Baki on 21.01.2025.
//

import Foundation

extension PastCellModel {
    convenience init(past: LaunchesResponse) {
        self.init(imageUrl: past.links.patch.small ?? "", name: past.name, date: past.dateLocal)
    }
}
