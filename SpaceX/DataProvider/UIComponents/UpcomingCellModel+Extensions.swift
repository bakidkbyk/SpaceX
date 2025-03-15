//
//  UpcomingCellModel+Extensions.swift
//  SpaceX
//
//  Created by Baki on 16.01.2025.
//

import Foundation

extension UpcomingCellModel {
    convenience init(upcoming: LaunchesResponse) {
        self.init(imageUrl: upcoming.links.patch.small ?? "", name: upcoming.name, date: upcoming.dateLocal)
    }
}
