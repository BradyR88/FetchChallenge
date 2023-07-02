//
//  RecipeTests.swift
//  FetchChallengeTests
//
//  Created by Brady Robshaw on 6/30/23.
//

import XCTest
@testable import FetchChallenge

final class RecipeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_customDecoding_returnsExpectedValue() throws {
        //Given
        let data = Data("""
        {"meals":[{"idMeal":"52910","strMeal":"Chinon Apple Tarts","strDrinkAlternate":null,"strCategory":"Dessert","strArea":"French","strInstructions":"To make the red wine jelly, put the red wine, jam sugar, star anise, clove, cinnamon stick, allspice, split vanilla pod and seeds in a medium saucepan. Stir together, then heat gently to dissolve the sugar.","strMealThumb":"https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/qtqwwu1511792650.jpg","strTags":"Tart,Baking","strYoutube":"https:\\/\\/www.youtube.com\\/watch?v=5dAW9HQgtCk","strIngredient1":"Puff Pastry","strIngredient2":"Dark Brown Soft Sugar","strIngredient3":"Braeburn Apples","strIngredient4":"Red Wine Jelly","strIngredient5":"Creme Fraiche","strIngredient6":"Icing Sugar","strIngredient7":"Cardamom","strIngredient8":"","strIngredient9":"","strIngredient10":"","strIngredient11":"","strIngredient12":"","strIngredient13":"","strIngredient14":"","strIngredient15":"","strIngredient16":"","strIngredient17":"","strIngredient18":"","strIngredient19":"","strIngredient20":"","strMeasure1":"320g","strMeasure2":"4 tbs","strMeasure3":"3","strMeasure4":"4 tbs","strMeasure5":"100ml","strMeasure6":"1 tbs","strMeasure7":"3","strMeasure8":"","strMeasure9":"","strMeasure10":"","strMeasure11":"","strMeasure12":"","strMeasure13":"","strMeasure14":"","strMeasure15":"","strMeasure16":null,"strMeasure17":" ","strMeasure18":" ","strMeasure19":" ","strMeasure20":"","strSource":"https:\\/\\/www.bbcgoodfood.com\\/recipes\\/chinon-apple-tarts","strImageSource":null,"strCreativeCommonsConfirmed":null,"dateModified":null}]}
        """.utf8)
        
        //When
        let decodedJSON = try? JSONDecoder().decode([String:[Recipe]].self, from: data)
        let returnedRecipeModel = decodedJSON?["meals"]?.first ?? nil
        
        //Then
        let expectedReturn = Recipe(idMeal: "52910", strMeal: "Chinon Apple Tarts", strInstructions: "To make the red wine jelly, put the red wine, jam sugar, star anise, clove, cinnamon stick, allspice, split vanilla pod and seeds in a medium saucepan. Stir together, then heat gently to dissolve the sugar.", ingredients: ["Puff Pastry","Dark Brown Soft Sugar","Braeburn Apples","Red Wine Jelly","Creme Fraiche","Icing Sugar","Cardamom"], measures: ["320g","4 tbs","3","4 tbs","100ml","1 tbs","3"])
        XCTAssertEqual(returnedRecipeModel, expectedReturn, "Decoded JSON doesn't match the given Recipe() object")
        
    }
    
    func test_formattingInstructions() {
        //Given
        let given = Recipe(idMeal: "52910", strMeal: "Chinon Apple Tarts", strInstructions: "To make the red wine jelly, put the red wine, jam sugar, star anise, clove, cinnamon stick, allspice, split vanilla pod and seeds in a medium saucepan. Stir together, then heat gently to dissolve the sugar.", ingredients: ["Puff Pastry","Dark Brown Soft Sugar"], measures: ["320g","4 tbs"])
        
        //When
        let formattedInstructions = given.formattedInstructions
        
        //Then
        let expectedReturn = "320g - Puff Pastry\n4 tbs - Dark Brown Soft Sugar\n\nTo make the red wine jelly, put the red wine, jam sugar, star anise, clove, cinnamon stick, allspice, split vanilla pod and seeds in a medium saucepan. Stir together, then heat gently to dissolve the sugar."
        XCTAssertEqual(formattedInstructions, expectedReturn, "Incorrectly formatting instruction text.")
    }
}
