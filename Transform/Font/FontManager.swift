//
//  FontManager.swift
//  Transform
//
//  Created by SeongHoon Jang on 2022/10/29.
//

import SwiftUI

//MARK: Font Extension
/*
 커스텀 폰트 사용을 도와주는 extension
 
 다음과 같이 사용한다.
 Text("Hello, World!")
     .font(.poppins(.semibold, size: 50))
 
 Text("Hello, World!")
     .font(.poppins(.medium))
 */
extension Font {
    enum Poppins {
        case semibold
        case medium
        case custom(String)
        
        var value: String {
            switch self {
            case .semibold:
                return "Poppins-SemiBold"
            case .medium:
                return "Poppins-Medium"
            case .custom(let name):
                return name
            }
        }
    }

    static func poppins(_ type: Poppins, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
}
