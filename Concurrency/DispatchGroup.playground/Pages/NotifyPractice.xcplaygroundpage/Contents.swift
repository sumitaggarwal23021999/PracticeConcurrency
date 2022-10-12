import UIKit
import Foundation

func notifyDispatchGroup() {
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
        for _ in 0...45 {
            debugPrint("Task 3 is running")
        }
    }
    
    group.notify(queue: DispatchQueue.main) {
        debugPrint("All task has been completed")
    }
}

notifyDispatchGroup()

