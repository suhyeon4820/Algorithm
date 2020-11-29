import UIKit

//********************************
// 수 정렬하기, 2750 - (하) 정렬
//********************************

let inputCount = 10
var inputs = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

//선택정렬
func selectionSort(array: inout [Int]){
    for i in stride(from: array.count - 1, through: 1, by: -1){
        var maxIndex = i
        for j in 0 ..< i {
            if(array[maxIndex] <= array[j]) {
                maxIndex = j
            }
        }
        let temp = array[maxIndex]
        array[maxIndex] = array[i]
        array[i] = temp
    }
}

//버블정렬
func bubbleSort(array: inout [Int]){
    for i in stride(from: array.count - 1, through: 0, by: -1){
        for j in 0 ..< i {
            if(array[j] >= array[j+1]){
                let temp = array[j+1]
                array[j+1] = array[j]
                array[j] = temp
            }
        }
    }
}

//삽입정렬
func insertionSort(array: inout [Int]){
    for i in 1 ..< array.count {
        let temp = array[i]
        var index = i - 1
        while(index >= 0 && array[index] >= temp){
            array[index+1] = array[index]
            index -= 1
        }
        array[index+1] = temp
    }
}
selectionSort(array: &inputs)
bubbleSort(array: &inputs)
insertionSort(array: &inputs)

