import UIKit

//********************************
// 수 찾기, 1920 - (하) 해시/구현/배열
//********************************
let n = 5
let hash: [Int : Int] = [4:0,
                         1:1,
                         5:2,
                         2:3,
                         3:4]
let array = [1, 3, 7, 9, 5]


for i in 0..<array.count {
    //let key = array[i]
    if hash[array[i]] != nil {
        print(1)
    } else {
        print(0)
    }
}
