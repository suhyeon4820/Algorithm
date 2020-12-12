import UIKit
import Foundation
import PlaygroundSupport

//********************************
// 거스름돈, 5585 - (하) 그리디
//********************************


let money = 380
let coins = [500, 100, 50, 10, 5, 1]

func calculateChange(_ money: Int) -> Int {
    var change = 1000 - money
    var count = 0
    
    for i in 0..<coins.count {
        count += change/coins[i]
        change = change%coins[i]
    }
    return count
}

calculateChange(money)
