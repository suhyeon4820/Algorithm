import UIKit
//********************************
// 음계, 2920 - (하) 배열/구현
//********************************
let list = [1, 2, 3, 4, 5, 6, 7, 8]
//let list = [8, 7, 6, 5, 4, 3, 2, 1]
//let list = [4, 3, 2, 6, 7, 8, 1, 5]

var ascending: Bool = true
var descending: Bool = true

for i in 0..<list.count-1 {
    if list[i] > list[i+1] {
        ascending = false
    } else {
        descending = false
    }
}

if ascending {
    print("ascending")
} else if descending {
    print("descending")
} else {
    print("mixed")
}

// 입력 1 2 3 4 5 6 7 8 -> 8개의 정수가 공백을 기준을 한 줄에 입력
// var list = readLine()!.split(separator: " ").map{Int($0)!}
//                "1", "2", "3"       -> [1, 2, 3]

