import UIKit
import Foundation
import PlaygroundSupport

//********************************
// 숨바꼭질, 1697 - (하) BFS
//********************************
let x = 5
let lastNum = 17

var queue = [Int]()
var count = 0
var addNum = [Int]()

func bfs(x: Int) {
    queue.append(x)
    let first = queue.removeFirst()
    addNum.append(first+1)
    addNum.append(first-1)
    addNum.append(first*2)
    queue.append(contentsOf: addNum)
    for i in 1...5 {
        if queue.contains(lastNum) {
            print("over")
            bfs(x: x)
        }
    }
}
bfs(x: x)
print(queue)
