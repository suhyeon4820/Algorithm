import UIKit


//********************************
// 친구 네트워크, 4195 - (중) 해시/집합/그래프
//********************************
//let name1 = ["Fred", "Barney"]  // 2
//let name2 = ["Barney", "Betty"] // 3
//let name3 = ["Betty", "Wilma"]  // 4

let name1 = ["Fred", "Barney"]   // 2
let name2 = ["Betty", "Wilma"]   // 2
let name3 = ["Barney", "Betty"]  // 4


var count: Int = 2
var friends: [String: Int] = [ : ]

func countFriend(_ list: [String]) {
    var value: Int = 0
    for i in 0...1 {
        if friends[list[i]] == nil {
            friends[list[i]] = value
            value += 1
        } else {
            count += 1
        }
    }
    print(count)
}
countFriend(name1)
countFriend(name2)
countFriend(name3)

