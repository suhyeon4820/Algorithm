## Sorting

- 데이터를 특정한 기준에 따라 순서대로 나열한 것

- 일반적으로 문제 상황에 따라서 적절한 정렬 알고리즘이 공식처럼 사용됨

### 1. 선택 정렬 (Selection Sort)

- 처리되지 않은 데이터 중에서 **가장 작은 데이터를 선택해 맨 앞에 있는 데이터와 바꾸는 것을 반복**

- 배열의 모든 요소를 비교하지만 교환은 단 한번만 이루어짐

- 선택 정렬은 N번 만큼 가장 작은 수를 찾아서 맨 앞으로 보내야 함

  - 구현 방식에 따라 사소한 오차는 있을 수 있지만. 전체 연산 횟수는 다음과 같음

    ```
    N + (N-1) + (N-2) + ... + 2
    ```

  - (N제곱 + N -2)/2 로 표기할 수 있는데 빅오 표기법에 따라 O(N제곱)
  
- 알고리즘

  ```swift
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
  
  selectionSort(array: &inputs)
  ```

  

### 버블 정렬

- 인접한 값을 비교해서 더 큰 수를 뒤로 보내 정렬하는 알고리즘

  ```swift
  var inputs = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]
  
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
  
  bubbleSort(array: &inputs)
  ```
### 2. 삽입 정렬

- 처리되지 않은 데이터를 하나씩 골라 적절한 위치에 삽입

- 선택 정렬에 비해 구현 난이도가 높은 편이지만 일반적으로 더 효율적으로 동작

- 삽입 정렬의 시간 복잡도는 O(N제곱)이며, 선택 정렬과 마찬가지로 반복뭉니 두 번 중첩되어 사용

- 선택 정렬은 <u>현재 리스트의 데이터가 거의 정렬되어 있는 상태라면 매우 빠르게 동작</u>
  
  - 최선의 경우 O(N)의 시간 복잡도를 가짐
  
  ```swift
  var inputs = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]
    
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
    
    insertionSort(array: &inputs)
  ```
  
    

### 3. 퀵 정렬

- <u>기준 데이터를 설정</u>하고 그 **기준보다 큰 데이터와 작은 데이터의 위치를 바꾸는 방법**

- 일반적인 상황에서 가장 많이 사용되는 정렬 알고리즘 중 하나
- 병합 정렬과 더불어 대부분의 프로그래밍 언어의 정렬 라이브러리의 근간이 되는 알고리즘
- 가장 기본적인 퀵 정렬은 **첫 번째 데이터를 기준 데이터(Pivot)로 설정**
- 퀵 정렬은 평균의 경우 O(NlogN)의 시간 복잡도를 가짐
  - 하지만 최악의 경우 O(N제곱)의 시간 복잡도를 가짐

```swift
var array = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]

func quikSort(array: [Int]) -> [Int] {
  	// 배열이 비어있으면 종료
    guard array.count > 1 else { return array }
    // pivot을 중간값으로 설정
    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot } // pivot 보다 작은 값
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot } // pivot 보다 큰 값
    let result = quikSort(array: less) + equal + quikSort(array: greater)
    print(result)
    return result
}

quikSort(array: array)

```







<img src = "\image\01.png">

### 4. 계수 정렬



---

| 정렬 알고리즘 | 평균 시간 복잡도 | 공간 복잡도 | 특징                                                         |
| ------------- | ---------------- | ----------- | ------------------------------------------------------------ |
| 선택 정렬     | O(N제곱)         | O(N)        | 아이디어가 매우 간단                                         |
| 삽입 정렬     | O(N제곱)         | O(N)        | 데이터가 거의 정렬되어 있을 때는 가장 빠름                   |
| 퀵 정렬       | O(NlogN)         | O(N)        | 대부분의 경우에 가장 적합하며, 충분히 빠름                   |
| 계수 정렬     | O(N+K)           | O(N+K)      | 데이터의 크기가 한정되어 있는 경우에만 사용이 가능 <br />매우 빠르게 동작 |

