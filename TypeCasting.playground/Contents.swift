import UIKit

class MediaType {
}

class Movie: MediaType {
    var title: String = ""
}

func getMedia() -> MediaType {
    let movie = Movie()
    movie.title = "Star Wars"

    return movie
}

let someMedia = getMedia()

// checking type

if someMedia is Movie {
    print("someMedia is an instance of Movie")
}

// downcasting

if let movie = someMedia as? Movie {
    print(movie.title)
}

// type casting for Any and AnyObject

var things = [Any]()

things.append(10)
things.append(34.56)
things.append("Andre")

for thing in things {
    switch thing {
    case is Int:
        print("integer found")
    case let someDouble as Double:
        print("\(someDouble)")
    case let someString as String:
        print("\(someString)")
    default:
        print("thing not handled")
    }
}
