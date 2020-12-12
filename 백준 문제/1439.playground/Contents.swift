import UIKit
import Foundation
import PlaygroundSupport

//********************************
// 뒤집기, 1439 - (하) 그리디
//********************************
// 간단한데 강력한 스킬 자주 사용해야겠음

//let s = "0001100"
let s = "100011001"
var num = [String]()

func foundCount(_ s: String) -> Int {
    var count = 0
    var startZero = 0
    var startOne = 0
    
    if s.hasPrefix("1") {
        startZero += 1
    } else {
        startOne += 1
    }
    
    for char in s {
        num.append("\(char)")
    }
   
    for i in 0..<num.count-1 {
        if num[i] != num[i+1] {
            if num[i+1] == "1" {
                startOne += 1
            } else {
                startZero += 1
            }
        }
    }
    
    count = min(startOne, startZero)
    return count
}
foundCount(s)
