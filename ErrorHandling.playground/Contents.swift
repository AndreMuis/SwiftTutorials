import UIKit

// handling errors using do-catch

enum PasswordError: Error {
    case empty
    case tooShort
}

class Account {
    var password = ""
    
    // same format for init() that throws an error
    func updatePassword(password: String) throws {
        guard password.isEmpty == false else { throw PasswordError.empty }
        guard password.count > 4 else { throw PasswordError.tooShort }
    
        self.password = password
    }
}

let account = Account()

do {
    try account.updatePassword(password: "abc")
} catch PasswordError.empty {
    print("password cannot be empty")
} catch PasswordError.tooShort {
    print("password is too short")
} catch {
    print("unexpected error: \(error)")
}

// converting errors to optional values

enum SomeError: Error {
    case someErrorCondition
}

func someThrowingFunction() throws -> Int {
    throw SomeError.someErrorCondition
}

var x: Int? = 100

do {
    x = try someThrowingFunction()
} catch {
    print(x ?? "nil")
}

// disabling error propagation

func anotherThrowingFunction() throws {
}

try! anotherThrowingFunction()

// specifying cleanup actions

func processFile(path: String) throws {
    defer {
        print("close file")
    }

    print("reading file")
    
    try String(contentsOfFile: path)
}

do {
    try processFile(path: "")
} catch {
    print("error occured while reading file")
}
