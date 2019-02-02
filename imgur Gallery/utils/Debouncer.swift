//
//  Debouncer.swift
//  imgur Gallery
//
//  Created by Gerardo Tarazona on 01/02/2019.
//  Copyright © 2019 Gerardo Tarazona. All rights reserved.
//

import Foundation

class Debouncer {

    var closure: ClosureHandler?
    typealias ClosureHandler = () -> Void
    private let timeInterval: TimeInterval
    private var timer: Timer?
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    func restarInterval() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { [weak self] timer in
            self?.checkTimer(timer)
        })
    }
    
    private func checkTimer(_ timer: Timer) {
        guard timer.isValid else {
            return
        }
        closure?()
        closure = nil
    }
    
}
