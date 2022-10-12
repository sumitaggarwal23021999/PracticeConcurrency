import UIKit
import Foundation

func queueTesting() {
    let queue = DispatchQueue(label: "Sumit.Serial.Queue")
    queue.sync {
        debugPrint("Task 1 started")
        for i in 0...5 {
            debugPrint(i)
        }
        debugPrint("Task 1 finshed")
    }
    
    queue.sync {
        debugPrint("Task 2 started")
        for i in 0...5 {
            debugPrint(i)
        }
        debugPrint("Task 2 finshed")
    }
}

queueTesting()
