import UIKit
import Foundation
import Darwin

func syncWaitGroup() {
    let group = DispatchGroup()
    let queue = DispatchQueue(label: "com.sumit.dispatchGroupQueue1")
    let someQueue = DispatchQueue(label: "com.sumit.dispatchGroupQueue2")
    
    queue.async(group: group) {
        for _ in 0...25 {
            debugPrint("Task 1 is running")
        }
    }
    
    queue.async(group: group) {
        for _ in 0...15 {
            debugPrint("Task 2 is running")
        }
    }
    
    someQueue.async(group: group) {
        Thread.sleep(until: Date().addingTimeInterval(5))
        for _ in 0...45 {
            debugPrint("Task 3 is running")
        }
    }
    
    if group.wait(timeout: .now() + 5) == .timedOut {
        debugPrint("I got tired of waiting")
    } else {
        debugPrint("All tasks are done")
    }
}

syncWaitGroup()
