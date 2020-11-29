import UIKit

//********************************
// 트로피 진열, 1668 - (하) 탐색
//********************************
let n = 7
var list = [2, 7, 3, 4, 6, 4, 3]
//var list = [3, 4, 6, 4, 3, 7, 2]
//var list = [1, 2, 3, 4, 5]


func ascendingList(list: [Int]) -> Int {
    var count = 1 // 중요
    var now = list[0]
    for i in 1..<n {
        if now < list[i] {
            count += 1
            now = list[i]
        }
    }
    print(count)
    return count
}

ascendingList(list: list)
let list2: [Int] = list.reversed()
ascendingList(list: list2)

