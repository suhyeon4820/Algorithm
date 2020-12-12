### 배열 (Array)

***

>**정의** : 데이터 원소들의 리스트로 각 데이터를 인덱스에 대응하도록 구성한 데이터 구조

- **특징** : 같은 종류의 데이터를 **순차적으로** 저장하고 효율적으로 관리하기 위해 사용
- **장점** : 빠른 접근 가능 -> Index(인덱스)로 해당 Element(원소)에 접근가능

  - 인덱스의 값만 알고 있으면 `O(1)`에 가능
  -  **Random Access**가 가능

  - 논리적 저장 순서와 물리적 저장 순서가 일치
- **단점** : 데이터 추가 / 삭제의 어려움

  - 미리 최대 길이를 지정해야 함 (swift에서는 repeating을 이용해 배열 생성)

    ```swift
    let n = 5
    var array =[Int](repeating: 0, count: n))
    // [0, 0, 0, 0, 0]
    ```

  - 해당 원소의 접근은 인덱스를 알면 O(1)에 가능하지만 삭제의 경우 추가적인 작업이 필요
    -  e.g. int arr[100]의 정적 배열에서 arr[30]의 원소를 삭제 할 경우 남은 뒷부분은 앞으로 빈곳을 채우기 위해 `shift`하는 작업이 필요하고 비용이 발생 -> 이때 시간 복잡도는 `O(n)`이 걸린다(n == 배열의 사이즈)
    - 규칙에 의해 정렬되어있는 배열에 원소를 삽입의 경우에도 마찬가지다 사이에 값을 삽입 하려고 하면 뒤로 값들을 밀어야 하기 때문에 `O(n)`이 걸린다.
    - Array 삭제 기능에 대한 time complexity의 worst case O(n)이 된다.



#### 1. 검색 (Search)

>자료 구조 내에서 특정 값을 찾는 것

##### 1) Linear Search

- 인덱스 번호로 빠르게 검색 가능

  ```swift
  let thirdElement = number[2]
  
  let firstElement = numbers.first
  let lastElement = numbers.last
  ```

  

- 인덱스를 모르면 원하는 값을 찾을 때까지 모든 셀을 검색해야 함

- 시간복잡도 : N개의 셀로 이뤄진 배열은 최대 N개의 단계가 필요 -> `O(N)`

<img src = "image\01\01.png" width = "600"/>

##### 2) Binary Search

- 정렬된 데이터 집합을 이분화하면서 탐색하는 방법



#### 2. 삽입 (Insert)

>자료 구조에 새로운 값을 추가하는 것

##### 1) 배열의 끝에 추가

- 배열의 길이를 알기 때문에 끝에 삽입하는 작업 한 단계만 필요

  ```swift
  var numbers = [1, 2, 3, 4, 5, 6, 7]
  numbers.append(8) // [1, 2, 3, 4, 5, 6, 7, 8]
  ```

<img src = "image\01\02.png" width = "500"/>



##### 2) 배열의 시작에 추가

- 모든 데이터를 오른쪽으로 한칸씩 이동한 후 맨 앞에 삽입

- 시간복잡도 : O(N) -> N번의 이동 + 1번의 삽입

  ```swift
  var numbers = [1, 2, 3, 4, 5, 6, 7]
  numbers.insert(8, at: 0) // [8, 1, 2, 3, 4, 5, 6, 7]
  ```
  
  
  
  <img src = "image\01\03.png" width = "600"/>



##### 3) 배열의 중간에 추가

- 삽입할 위치에서 한칸씩 오른쪽으로 이동 후 빈 공간에 삽입

  ```swift
  var numbers = [1, 2, 3, 4, 5, 6, 7]
  numbers.insert(8, at: 4) // [1, 2, 3, 4, 8, 5, 6, 7]
  ```
  
  
  
  <img src = "image\01\04.png" width = "600"/>



#### 3. 삭제 (Delete)

>자료 구조에서 값을 제거하는 것

##### 1) 배열의 끝에서 삭제

- **마지막에 입력된 데이터**를 삭제하는 작업 한 단계

  ```swift
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8]
  numbers.remove(at: 7)
  numbers.removeLast(1)
  ```
  
  <img src = "image\01\05.png" width = "500"/>

##### 2) 배열의 시작에서 삭제

- 첫 번째 element를 삭제하고 빈 공간을 채우기 위해 왼쪽으로 한칸씩 이동해야 함

- 시간복잡도 : O(N) -> 왼쪽으로 한칸씩 이동 (N : 배열 길이)

  <img src = "image\01\06.png" width = "600"/>

  ```swift
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8]
  numbers.remove(at: 0)
  ```
  
  

##### 3) 배열의 중간에서 삭제



<img src = "image\01\07.png" width = "600"/>

```swift
var numbers = [1, 2, 3, 4, 5, 6, 7, 8]
numbers.remove(at: 4)
```





