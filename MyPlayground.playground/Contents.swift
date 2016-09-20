//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let single = "Pok\u{00E9}mon"
let double = "Pok\u{0065}\u{0301}mon"

(single, double)

single.characters.count
double.characters.count

single.utf16.count
double.utf16.count

let nssingle = NSString(characters: [0x0065,0x0301], length: 2)
nssingle.length
let nsdouble = NSString(characters: [0x00e9], length: 1)
nsdouble.length // → 1
nssingle == nsdouble // → false

single.utf16.elementsEqual(double.utf16) // → false

let chars: [Character] = [
    "\u{1ECD}\u{300}",      // ọ́
    "\u{F2}\u{323}",        // ọ́
    "\u{6F}\u{323}\u{300}", // ọ́
    "\u{6F}\u{300}\u{323}", // ọ́
]

//chars.dropFirst().all{ $0 == chars.first}

extension Sequence {
    func all(f: (Iterator.Element) throws -> Bool) rethrows -> Bool {
        for x in self where try !f(x) {
            return false
        }
        return true
    }
}

1
2
3
4
5
6
//
let zalgo = "s̼̐͗͜o̠̦̤ͯͥ̒ͫ́ͅo̺̪͖̗̽ͩ̃͟ͅn̢͔͖͇͇͉̫̰ͪ͑"

zalgo.characters.count
zalgo.utf16.count
zalgo.utf8.count

let flags = "🇨🇳🇭🇰"
flags.characters.count // → 1
flags.unicodeScalars.map{ String($0) }.joined(separator: ",")

1
2
3
"👩🏾".characters.count // → 2
"👨‍👨‍👧‍👧".characters.count // → 4
"👩\u{200D}👩\u{200D}👦\u{200D}👦" == "👩‍👩‍👦‍👦" //
"👩👩👦👦".characters.count
"👩👩👦👦" == "👩‍👩‍👦‍👦"

var greeting = "Hello, world!"
//String
//已删除
//greeting.dropFirst(7)
let s = "abcdef"
// 从开始位置到下标为4的字符
let idx = s.index(s.startIndex, offsetBy: 4)
s[idx] // → "f" (the Character, not the String)

//是否包含此下标
let safeIdx = s.index(s.startIndex, offsetBy: 0, limitedBy: s.endIndex)
safeIdx // 0

extension String {
    subscript(idx: Int) -> Character {
        //先拿到下标
        guard let strIdx = index(startIndex, offsetBy: idx, limitedBy: endIndex)
            else { fatalError("String index out of bounds") }
        //返回此下标的字符
        return self[strIdx]
    }
}

s[1]

for i in 0..<s.characters.count {
    print(s[i])
}

s[s.startIndex..<s.index(s.startIndex, offsetBy: 5)]

s.characters.prefix(2)

//打印下标和字符
for (i, c) in "hello".characters.enumerated() {
    print("\(i): \(c)")
}

var hello = "Hello!"
if let idx = hello.characters.index(of: "e") {
    //在某个下标的位置插入字符串
    hello.insert(contentsOf: ", world".characters, at: idx)
}


extension String: RangeReplaceableCollection { }

//    var greeting = "Hello, world!"
if let comma = greeting.index(of: ",") {
    //取开始位置到comma位置的字符串
    print(greeting[greeting.startIndex..<comma])
    
    //使用下面的字符串  从开始替换到结束
    greeting.replaceSubrange(greeting.startIndex..<greeting.endIndex,
                             with: "How about some original example strings?")
}

//去字符串后四位
let world = "Hello, world!".characters.suffix(4).dropLast()
String(world) // → "rld"

let world1 = "Hello, world!".characters.suffix(40).dropLast()
String(world1) // → Hello, world!"

//extension Collection {
//    func split(maxSplits: Int = default,
//        omittingEmptySubsequences: Bool = default,
//        whereSeparator isSeparator: (Self.Iterator.Element) throws -> Bool) rethrows
//        -> [AnySequence<Self.Iterator.Element>]
//}
//
//let commaSeparatedArray = "a,b,c".characters.split { $0 == "," }
//commaSeparatedArray.map(String.init) // → ["a", "b", "c"]

extension String {
    func wrapped(after: Int = 70) -> String {
        var i = 0
        let lines = self.characters.split(omittingEmptySubsequences: false) { character in
            switch character {
            case "\n",
                 " " where i >= after:
                i = 0
                return true
            default:
                i += 1
                return false
            }
            }.map(String.init)
        return lines.joined(separator: "\n")
    }
}

let paragraph = "The quick brown fox jumped over the lazy dog."
//
paragraph.wrapped(after: 15)

1
2
3
4
5
6
7
8
9
//extension Collection where Iterator.Element: Equatable {
//    public func split(separator: Self.Iterator.Element,
//                      maxSplits: Int = default,
//        omittingEmptySubsequences: Bool = default)
//        -> [Self.SubSequence]
//}
//
//"1,2,3".characters.split(separator: ",").map(String.init)

extension Collection where Iterator.Element: Equatable {
    func split<S: Sequence>(separators: S) -> [SubSequence]
        where Iterator.Element == S.Iterator.Element
    {
        return split { separators.contains($0) }
    }
}

//以字符",","!"分割字符串返回数组
"Hello, w!orld!".characters.split(separators: ",! ".characters).map(String.init)

//空格分割单词
extension String {
    func words(with charset: CharacterSet = .alphanumerics) -> [String] {
        return self.unicodeScalars.split {
            !charset.contains($0)
            }.map(String.init)
    }
}

let s1 = "Wow! This contains _all_ kindsboys of things like 123 and "
s1.words()

//extension String.UTF16View : RandomAccessCollection {}
extension Collection
    where Iterator.Element: Equatable,
    SubSequence.Iterator.Element == Iterator.Element,
    Indices.Iterator.Element == Index
{
    func search<S: Sequence>(_ pattern: S) -> Index?
        where S.Iterator.Element == Iterator.Element
    {
        return indices.first { idx in
            self[idx..<endIndex].starts(with: pattern)
        }
    }
}

let helloWorld = "Hello, world!"
if let idx = helloWorld.utf16.search("world".utf16)?
    .samePosition(in: helloWorld)
{
    print(helloWorld[idx..<helloWorld.endIndex])
}

let text = "Look up your Pok\u{0065}\u{0301}mon in a Pokédex."
text.utf16.search("Pokémon".utf16) // → nil

print(String(describing: text.utf16.search("up".utf16)))

let nonAlphas = CharacterSet.alphanumerics.inverted
text.unicodeScalars.split(whereSeparator: nonAlphas.contains)

