//
//  HanoiQuestResult.swift
//  UnitTestTraining
//
//  Created by Huy Pham on 9/25/20.
//  Copyright © 2020 Sun Asterisk. All rights reserved.
//

import Foundation

enum HanoiQuestResult {

    case roomNotFound
    case roomFound
    case roomOpened
    case beatBigBoss

    var description: String {
        switch self {
        case .roomNotFound:
            return "Bạn không tìm thấy phòng!"
        case .roomFound:
            return "Bạn tìm thấy phòng nhưng không mở được cửa!"
        case .roomOpened:
            return "Bạn đã chiến đấu dũng cảm, nhưng thua!"
        case .beatBigBoss:
            return "Bạn đã chiến thắng Big Boss, chúc mừng!"
        }
    }
}
