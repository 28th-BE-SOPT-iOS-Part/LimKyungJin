## 서버통신 개념 ##

### HTTP 통신 ###

클라이언트의 요청(Request)있을 때만 서버가 응답(Response) 하고 연결 종료하는 단방향 통신 

- server → client로 요청 ❌
- GET: 데이터를 얻고 싶을 때
- HEAD: 헤더 정보를 얻고 싶을 때
- POST: 내용 전송시
- PUT: 내용 갱신시
- DELETE: 내용 삭제가 필요할 때
- OPTIONS: 가능한 메소드 옵션 파악 필요할 때
- TRACE: 리소스가 수신되는 경로 파악할 때
- PATCH: 리소스를 일부 수정할 때

HTTP 통신 필요한 프로젝트 설정 

- Info.plist 파일 → App Transport Security Settings 추가 → Allow Arbitrary Load 추가 → Value yes로 되어있어야

GET? 

- 클라이언트가 요청하고자 하는 데이터를 url에 담아서 보내느 방식
- 단점: 길이제한, 쿼리가 그대로 노출될 수 있음

POST? 

- 클라이언트가 요청하고자 하는 데이터를 HTTP 메세지 body에 담아 보내는 형식
- 길이제한 없고 요청 데이터 노출 걱정 없음
- 추가적으로 보안 신경써줘야 함

REST: Representational State Transfer 

REST API: 행위 / 자원 / 메세지로 나뉨 

- 행위: GET•POST•PUT•DELETE 중에 하나 

- 자원: url 

- 메세지: JSON 포맷의 데이터로 받음 

- JSON 데이터를 처리할 때
    - Decode: JSON data를 원하는 모델로 변환, Decodable 채택

        Decodable protocol: a type that can decode itself from an external rep

    - Encode: 모델을 원하는 JSON 으로 변환, Encodable 채택

        Encodable protocol: a type that can encode itself to an external rep 

→ 여기서 external representation = JSON 

Codable: a type that can convert itself into/out of an external representation

- Encodable과 Decodable protocol을 둘 다 채택함 → 동시에 묶어서 사용가능



### Encoder Example ###

```swift
struct Cookie: Codeable {
	let name: String 
	let price: Int 

}

let cookie = Cookie(name: "Chocolate Cookie", price: 3540) 
let data = try! JSONEncoder().encode(cookie) 

```

우선, name과 price를 가지고 있는 'Cookie' 구조체를 만들었고, 이를 활용해 cookie라는 객체를 활용했다. 그 다음, JSONEncoder().encode(cookie)에서 우리는 cookie 모델을 원하는 JSON으로 변환한다.

```swift
let jsonString = String(data: data, encoding: .utf8)! 
print(jsonString)
```

을 해보면, 

```swift
{"name": "Chocolate Cookie", "Price:": 3540}
```
이런 식으로 우리가 원하는 JSON 형식으로 변환된 것을 확인할 수 있다. 이 과정

Encoder의 outputFormatting: .prettyPrinted 커맨드는 console창에 json data를 string형식으로 보여준다 

```swift
let encoder = JSONEncoder() 
encoder.outputFormatting = .prettyPrinted 
```

### Decoder Example ###

*넘어오는 데이터의 구조가 바뀌었을 때* 

앞에서 했던 Encoder 예시의 반대라고 생각하면 된다. JSON 형식으로 되어있는 데이터, jsonString을 JSONDecoder를 사용해서 input data로 변환시킨다. 그리고 이 data는 새로운 cookie instance를 만드는 데에 사용된다. 

```swift
let jsonString = """
								{
									"name": "Chocolate Cookie", 
									"price": 3540
								 } 
									"""

let input = jsonString.data(using: .utf8)! 
let decoder = JSONDecoder()

let secondCookie = try! decoder.decode(Cookie.self, from:input)
```

### Codable's CodingKeys enum ###

- JSON에서 넘어오는 이름을 변환시킴

실제 프로젝트에서는 API를 사용할 때에 snake case notation (ex. var_name)을 가진 데이터를 주게 될텐데, 이런 경우에 CodingKeys 열거형이 쓰이게 된다. 앞에 만들었던 Cookie 예시를 다시 가지고 와서, 이번에는 'dateMade' 라는 property가 API가 새롭게 return한 property라고 생각해보자. 

```swift
struct Cookie: Codable {
	let name: String 
	let price: Int 
	let dateMade: Date
	
	enum CodingKeys: String, CodingKey {
		case name 
		case price 
		case dateMade = "date_Made"
	}
}
```

String 열거형을 사용해 CodingKey protocol을 채택해야 한다. 이 때에, 각 property마다 case를 채택해야한다. dateMade의 case에서 새롭게 "date_Made" 라는 custom value를 부여한 것처럼, 필요에 따라 값을 설정해 주어도 되고, 아니면 name이나 price처럼 그냥 두어도 된다. 

또 다른 케이스로, decode JSON에서 넘어 온 데이터에에 key-value pair가 존재하지 않을 때에는 직접 decode 부분을 작성해 주어야 한다!
