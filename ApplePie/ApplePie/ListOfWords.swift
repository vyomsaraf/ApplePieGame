//
//  ListOfWords.swift
//  ApplePie
//
//  Created by Ontic on 09/02/22.
//

import Foundation

struct listOfWords {
    
    private var listFruits = ["apple","mango","pomegrenate","guava","strawberry","coconut","dragonfruit","pineapple", "watermelon", "melon", "papaya", "orange","pear","avocado","lychee"]
    private var listVegetables = ["carrot","broccoli","cucumber","cauliflower","potato","cabbage","onion","spinach","tomato","bellpepper","pumpkin","artichoke","lettuce","okra","beetroot"]
    private var listCities = ["London","NewYork","Delhi","Mumbai","HongKong","Paris","Tokyo","Singapore","Sydney","Lahore","Indore","Kanpur","Jaipur","Kathmandu","Ahmedabad","Noida","Kolkata","Chennai"]
    private var listCountries = ["India","bhutan","Nepal","China","Britain","France","UnitedStatesofAmerica","Argentina","SouthAfrica","Lebanon","Egypt","Australia","Russia","Germany","Canada"]
    
    init(){
        
        listFruits = listFruits.map({
            return $0.lowercased()
        })
        listVegetables = listVegetables.map({
            return $0.lowercased()
        })
        listCities = listCities.map({
            return $0.lowercased()
        })
        listCountries = listCountries.map({
            return $0.lowercased()
        })
    }
    
    func wordList() -> String{
        let randomInt = Int.random(in: 1...4)
        switch randomInt {
        case 1:
            if let word = listFruits.randomElement(){
                return word
            }
            break
        case 2:
            if let word = listVegetables.randomElement(){
                return word
            }
            break
        case 3:
            if let word = listCities.randomElement(){
                return word
            }
            break
        default:
            if let word = listCountries.randomElement(){
                return word
            }
            break
        }
        return "game"
    }
        
}
