import UIKit

// 6-2 삽입 정렬
/*
 두 번째 데이터부터 시작(왼쪽은 정렬이 되어 있다고 생각)
 왼쪽에 있는 데이터와 비교해 오름차순으로 정렬함
 ex) 5부터 시작해 7과 오름차순을 비교해 7 앞으로 들어감 -> [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]
 그런 다음 9가 비교해 가만히 있고 0이 맨 앞으로 이동 -> [0, 5, 7, 9, 3, 1, 6, 2, 4, 8]
 */

//var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]
//
//var maxValue: Int
//
//for i in 1..<array.count {
//    var maxIndex = i
//    maxValue = array[i]
//    // 본인이 작으면 작은 값의 인덱스로 삽입
//    for j in stride(from: i, through: 0, by: -1) {
//        if array[i] < array[j] {
//            maxIndex = j
//        }
//    }
//    array[i] = array[maxIndex]
//    array[maxIndex] = maxValue
//    print(array)
//}

