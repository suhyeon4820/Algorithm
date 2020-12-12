import UIKit
// 주어진 수들을 m번 더해 가장 큰 수를 만들어라(해당 수 k번 까지 반복 가능)
// (6 + 6 + 6) + 5 + (6 + 6 + 6) + 5 = 46
let n = 5 // 배열의 크기
let m = 8 // 숫자가 더해지는 횟수
let k = 3 // 연속해서 던질 수 있는 수
var list = [2, 4, 5, 4, 6] // 배열

var list2 = [Int]()
var count = 0


func findMaxSum(_ list: [Int]) -> Int {
    var sum = 0
    var index = count%3
    list2 = list.sorted(by: >)
    
    while count != m {
        for i in 0..<5 {
            if count%3 == 0 {
                index += 1
                count += 1
                sum += list2[i]
            } else {
                sum += list2[i]
                count += 1
            }
        }
    }
    return sum
}
findMaxSum(list)
