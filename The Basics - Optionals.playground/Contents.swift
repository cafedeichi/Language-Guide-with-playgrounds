//★★★★★ Optionals ★★★★★

//StringをIntに変える例
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumberは"Int?"または"optional Int"に型推論される。数値に変換されなかった場合はnilを返す。
type(of:convertedNumber)    //ほらね

//★★★ nil ★★★

//変数にnilを設定すれば、その変数は値をもっていないことになる。
var serverResponseCode: Int? = 404
serverResponseCode = nil

//Nonoptionalにnilは設定できない
//var serverResponseCode2: Int = nil    //エラー
//型宣言をしなければ、nilで初期化はできない。（型推論ができない為）
//var serverResponseCode3 = nil         //エラー

//Optional変数で初期値を持たせない場合、初期値はnilになる。
var surveyAnswer: String?

//★★★ If Statements and Forced Unwrapping ★★★

//変数がnilかどうかチェック
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//変数の後に"!"をつけて値を取り出す(Forced Unwrapping)
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
    
}

//★★★ Optional Binding ★★★　（頻出です）

//actualNumberに代入される値がnilかどうか判定する。（actualNumberをif文内で変えたい場合は"if var..."と宣言する。）
if let actualNumber = Int(possibleNumber) {     //actualNumberはこのif文でしか使われない一時変数
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")  //Forced Unwrapping不要
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

//----------
//Optional Bindingを使わないで同じことをやろうとすると処理が長くなる
//（このサンプルだとありがたみがあまりないけどそのうちボディブローのように効いてきます...）
let convertedNumber2 = Int(possibleNumber)
if convertedNumber2 != nil {
    print("\"\(possibleNumber)\" has an integer value of \(convertedNumber2!)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}
//----------

//複数の条件はカンマ区切りで指定可能。途中でfalseになったら判定を中断、そのif文はfalseで処理される。
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {                                 //やってることはこれと一緒
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// if let aaa != ...はできません。guard letを使います。

//★★★ Implicitly Unwrapped Optionals ★★★

//普通のOptional
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

//Implicitly Unwrapped Optionals（暗黙アンラップオプショナル）
//let assumedString: String! = "An implicitly unwrapped optional string."
//let implicitString: String = assumedString //Forced Unwrappingをしなくても使える（暗黙アンラップ）

let assumedString: String! = nil    //そもそもOptionalなのでnilも代入できちゃう

//初期値は決めたくない（nilにする）が、使うときは値が絶対入っている時などが使いどころ。

if assumedString != nil {    //当たり前だけどnil判定できる
    print(assumedString)
}

if let definiteString = assumedString { //当たり前だけどOptional Bindingも使える
    print(definiteString)
}







