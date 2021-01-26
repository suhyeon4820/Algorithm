import UIKit

// 6-1 선택 정렬
/*
 데이터가 무작위로 여러 개 있을 때,
 이 중에서 가장 작은 데이터를 선택해 맨 앞에 있는 데이터와 바꾸고,
 그 다음 작은 데이터를 선택해 앞에서 두 번째 데이터와 바꾸는 과정 반복
 */

//var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]
//
//var minValue: Int
//
//for i in 0..<array.count {
//    var minIndex = i
//    minValue = array[i]
//    for j in i+1..<array.count {
//        if array[minIndex] > array[j] {
//            minIndex = j
//        }
//    }
//    array[i] = array[minIndex]
//    array[minIndex] = minValue
//}
//print(array)
