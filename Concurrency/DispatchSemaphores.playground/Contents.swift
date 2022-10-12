import UIKit

var music: [String] = []
func downloadMusic(name: String) -> String {
    sleep(4)
    debugPrint("Music has been downloaded: \(name)")
    return name
}

func saveMusic() {
    sleep(2)
    music.remove(at: 0)
    debugPrint("Musics have been saved")
}

func performOperation() {
    let semaphore = DispatchSemaphore(value: 1)
    let queue = DispatchQueue.global()
    queue.async {
        semaphore.wait()
        let name = downloadMusic(name: "Jeene ke hai char din!")
        music.append(name)
        semaphore.signal()
    }
    
    queue.async {
        semaphore.wait()
        saveMusic()
        semaphore.signal()
    }
}

performOperation()
