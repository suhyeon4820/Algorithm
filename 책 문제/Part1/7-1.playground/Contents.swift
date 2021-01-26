import UIKit

// 7-1 재귀 함수로 구현한 이진 탐색 소스코드
// target의 index값 4 찾기
let array = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
var end = 10
let target = 7
//*********************************************
var start = array[0]


func findTarget(array: [Int], target: Int, start: Int, end: Int) -> Int? {
    if start > end {
        return nil
    }
    let midIndex = start + end/2
    if array[midIndex] == target {
        return midIndex + 1
    } else if array[midIndex] > target {
        return findTarget(array: array, target: target, start: start, end: midIndex-1)
    } else {
        return findTarget(array: array, target: target, start: midIndex+1, end: end)
    }
}

findTarget(array: array, target: target, start: start, end: end)
