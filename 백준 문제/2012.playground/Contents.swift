import UIKit
import Foundation
import PlaygroundSupport

//********************************
// 등수 매기기, 2012 - (하) 그리디
//********************************

let n = 5
let score = [1, 5, 3, 1, 2]

let newScore = score.sorted(by: <)
var count = 0

for i in 0..<newScore.count {
    if newScore[i] != i+1 {
        count += 1
    }
}
print(count)
