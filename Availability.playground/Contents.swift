//: Playground - noun: a place where people can play

import UIKit


@available (iOS 8.0, *)
func firstFunction() -> String
{
    return "firstFunction"
}

@available (iOS 20.0, watchOS 2, *)
func secondFunction() -> String
{
    return "secondFunction"
}

if #available(iOS 9.0, *)
{
    firstFunction()
}

if #available(iOS 20.0, watchOS 2, *)
{
    secondFunction()
}

