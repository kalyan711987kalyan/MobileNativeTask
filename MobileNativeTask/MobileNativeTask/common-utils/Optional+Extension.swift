//
//  Optional+Extension.swift
//  MobileNativeTask
//
//  Created by kalyan chakravarthy on 05/06/24.
//

import Foundation

extension Optional where Wrapped == String {
    var emptyIfNil: String {
        guard let unwrapped = self else {
            return ""
        }
        return unwrapped
    }
}
