//★★★★★★ Early Exit ★★★★★

//if let name != person["name"]... って書きたいけどできないよね。
//そこで使うのがguard let（ちょっと違うけど）

func greet(person: [String: String]) {
    
    guard let name = person["name"] else { //nameがnilだったら即終了
        return                                      //returnやthrowなど、処理をぬけるための記述は必須です。
    }
    
    print("Hello \(name)!")     //if let...と異なり、宣言した変数はメソッド（ブロック）内で有効
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."
