import UIKit
// 숫자 카드 게임 : 가장 높은 숫자가 쓰인 카드 한 장을 뽑는 게임
// 조건 : 1.행을 먼저 선택, 2.선택한 행에서 가장 작은 수 뽑음
//let n = 3 // 행의 개수
//let m = 3 // 열의 개수
//let list1 = [3, 1, 2] // 행1
//let list2 = [4, 1, 4] // 행2
//let list3 = [2, 2, 2] // 행3
var minValues = [Int]()

let n = 2 // 행의 개수
let m = 4 // 열의 개수
let list1 = [7, 3, 1, 8]
let list2 = [3, 3, 3, 4]

func findMinRow(_ list: [Int]) -> Int {
    var minValue = 1000000
    for i in 0..<m {
        if list[i] < minValue {
            minValue = list[i]
        }
    }
    return minValue
}

minValues.append(findMinRow(list1))
minValues.append(findMinRow(list2))
//minValues.append(findMinRow(list3))

print(minValues.max())


//let n = 2 // 행의 개수
//let m = 4 // 열의 개수
//let list1 = [7, 3, 1, 8]
//let list2 = [3, 3, 3, 4]

