import UIKit

// 7-2 부품 찾기
let n = 5 // 매장 전체 부품 수
let m = [8, 3, 7, 9, 2] // m개 종류의 부품 번호

let array = m.sorted(by: <)

var start = 0
var end = n - 1
let mid = (start + end) / 2


func findPart(array: [Int], target: Int, start: Int, end: Int) -> Int? {
    while start <= end {
        let mid = start + end / 2
        if array[mid] == target {
            return mid + 1
        } else if array[mid] > target {
            return findPart(array: array, target: target, start: start, end: mid-1)
        } else {
            return findPart(array: array, target: target, start: mid+1, end: end)
        }
        
    }
    return mid + 1
}

for i in array {
    let result = findPart(array: array, target: i, start: start, end: end)
    print(i)
//    if result != nil {
//        print("Yes")
//    } else {
//        print("No")
//    }
}
