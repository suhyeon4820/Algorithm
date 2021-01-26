import UIKit

// 7-3 떡볶이 떡 만들기
let n = 4 // 떡이 개수
let m = 6 // 요청한 떡의 길이
let array = [19, 15, 10, 17] // 떡의 길이

// ********************************

let newArray = array.sorted(by: <)
var result = 0
var start = array.first
var end = array.last

func findResult(array: [Int], start: Int, end: Int) -> Int {
    let mid = start + end / 2
    var sum = 0
    for i in 0..<n {
        if array[i] > mid {
            sum += array[i] - mid
            if sum == m {
                return mid
            }
        }
    }
    return mid+1
}

findResult(array: newArray, start: start, end: end)
