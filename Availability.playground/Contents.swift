import Foundation


@available (iOS 9.0, *)
func firstFunction() -> String
{
    return "firstFunction"
}

@available (iOS 20.0, watchOS 2.0, *)
func secondFunction() -> String
{
    return "secondFunction"
}

if #available(iOS 10.0, *)
{
    firstFunction()
}

if #available(iOS 20.0, watchOS 2.0, *)
{
    secondFunction()
}

