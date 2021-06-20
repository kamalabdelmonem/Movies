//
//  apis.swift
//  safackat
//
//  Created by 10 on 9/11/20.
//  Copyright © 2020 swiftion. All rights reserved.
//

import Foundation
import Alamofire
import ChatLayout
import DifferenceKit


struct Place {
    let lat: Double?
    let long: Double?
    let name: String?
}
struct HelpImages: Codable {
    let message:String?
    let data: [String]?
    let errors: [String]?
}
struct FAQs: Codable {
    let message:String?
    let errors: [String]?
    let data: [FAQ]?
}
struct FAQ: Codable {
    let question: String?
    let answer: String?
    var isSelected: Bool?
    enum CodingKeys : String,CodingKey {
        case question,answer
        case isSelected = "is_selected"
    }
}

// sendUserData // getProfileData
struct Welcome: Codable {
    let message:String?
    let errors: [String]?
    let data: UserProfileData?
}
struct UserProfileData: Codable {
    let id: Int?
    let email: String?
    let name: String?
    let phoneNumber: PhoneNumber?
    let gender: ItemObject?
    let autoRenew: Bool?
    let age: String?
    let imageUrl: String?
    let birthDay: String?
    let currentWeight: String?
    let height: String?
    let targetWeight: String?
    let activityLevel: ItemObject?
    let fitnessGoal: ItemObject?
    let dietaryPlan: ItemObject?
    let plan: PlanItems?
    enum CodingKeys : String,CodingKey {
        case id,email,name,gender,age,height,plan
        case birthDay = "birth_day"
        case currentWeight = "current_weight"
        case targetWeight = "target_weight"
        case activityLevel = "activity_level"
        case fitnessGoal = "fitness_goal"
        case dietaryPlan = "dietary_plan"
        case phoneNumber = "phone_number"
        case autoRenew = "auto_renew"
        case imageUrl = "image_url"
    }
}
struct PhoneNumber: Codable {
    let number:String?
    let image:String?
    let phonePrefix:String?
    enum CodingKeys : String,CodingKey {
        case number,image
        case phonePrefix = "phone_prefix"
    }
}
struct ItemObject: Codable {
    let id:Int?
    let is_selected: Bool?
    let name:String?
    let description:String?
    let image:String?
    
    let title:String?
}


// SignUp
struct Token: Codable {
    let data: TokenData?
    let message:String?
    let errors: [String]?
}
struct TokenData: Codable {
    let token: String?
    let userID: Int?
    enum CodingKeys : String,CodingKey {
        case token
        case userID = "user_id"
    }

}

//struct Errors: Codable {
//    let email: [String]?
//    let fitnessGoalId: [String]?
//    let height: [String]?
//    let currentWeight: [String]?
//    let targetWeight: [String]?
//    let birthDay: [String]?
//    let genderId: [String]?
//    let activityLevelId: [String]?
//    let categoryIds: [String]?
//    let dietaryPlanId: [String]?
//    enum CodingKeys : String,CodingKey {
//        case email,height
//        case fitnessGoalId = "fitness_goal_id"
//        case currentWeight = "current_weight"
//        case targetWeight = "target_weight"
//        case birthDay = "birth_day"
//        case genderId = "gender_id"
//        case activityLevelId = "activity_level_id"
//        case categoryIds = "category_ids"
//        case dietaryPlanId = "dietary_plan_id"
//    }
//}

// FitnessGoals
struct FitnessGoals: Codable {
    let message:String?
    let data: [FitnessGoal]?
}
struct FitnessGoal: Codable {
    let id: Int?
    var isSelected: Bool?
    let name: String?
    let description: String?
    let image: String?
    enum CodingKeys : String,CodingKey {
        case id,name,description,image
        case isSelected = "is_selected"
    }
    
}


// Gender
struct Gender: Codable {
    let message:String?
    let data: [GenderList]?
}
struct GenderList: Codable {
    let id: Int?
    var isSelected: Bool?
    let name: String?
    let image: String?
    enum CodingKeys : String,CodingKey {
        case id,name,image
        case isSelected = "is_selected"
    }
    
}

// Activities
struct Activity: Codable {
    let message:String?
    let data: [Activities]?
}
struct Activities: Codable {
    let id: Int?
    var isSelected: Bool?
    let title: String?
    enum CodingKeys : String,CodingKey {
        case id,title
        case isSelected = "is_selected"
    }
    
}



// Categories
struct Category: Codable {
    let message:String?
    let data: [Categories]?
}
struct Categories: Codable {
    let id: Int?
    var isSelected: Bool?
    let name: String?
    let image: String?
    enum CodingKeys : String,CodingKey {
        case id,name,image
        case isSelected = "is_selected"
    }
    
}



// Dietary
struct Dietary: Codable {
    let message:String?
    let data: [Dietaries]?
}
struct Dietaries: Codable {
    let id: Int?
    var isSelected: Bool?
    let name: String?
    let description: String?
    let image: String?
    enum CodingKeys : String,CodingKey {
        case id,name,description,image
        case isSelected = "is_selected"
    }
    
}

// Results
struct Results: Codable {
    let message:String?
    let data: ResultItem?
}
struct ResultItem: Codable {
    let caloriesTitle:String?
    let caloriesPerDay:String?
    let startCaloriesRange:String?
    let endCaloriesRange:String?
    let targetDetailsTitle:String?
    let proteinPerDay:String?
    let startProteinRange:String?
    let endProteinRange:String?
    let carbPerDay:String?
    let startCarbRange:String?
    let endCarbRange:String?
    let fatPerDay:String?
    let startFatRange:String?
    let endFatRange:String?
    
    let message:String?
    
    enum CodingKeys : String,CodingKey {
        case message
        case caloriesTitle = "calories_title"
        case caloriesPerDay = "calories_per_day"
        case startCaloriesRange = "start_calories_range"
        case endCaloriesRange = "end_calories_range"
        case targetDetailsTitle = "target_details_title"
        case proteinPerDay = "protein_per_day"
        case startProteinRange = "start_protein_range"
        case endProteinRange = "end_protein_range"
        case carbPerDay = "carb_per_day"
        case startCarbRange = "start_carb_range"
        case endCarbRange = "end_carb_range"
        case fatPerDay = "fat_per_day"
        case startFatRange = "start_fat_range"
        case endFatRange = "end_fat_range"
    }
    
}


// Menu
struct Menu: Codable {
    let message:String?
    var data: [MenuDays]?
}
struct MenuDays: Codable {
    let id: Int?
    var isSelected: Bool?
    let time: String?
    let meals: [MealItems]?
    enum CodingKeys : String,CodingKey {
        case id,time,meals
        case isSelected = "is_selected"
    }
}
struct MealItems: Codable {
    let id:Int?
    let name:String?
    let image:String?
}


// Plans
struct Plan: Codable {
    let message:String?
    var data: Plans?
}
struct Plans: Codable {
    let monthly: [PlanItems]?
    let weekly: [PlanItems]?
}
struct PlanItems: Codable {
    let id: Int?
    var image: String?
    var name: String?
    var calories: String?
    var duration: String?
    var numberOfDays: String?
    var price: String?
    var vat: String?
    var total: String?
    var skipAbility: String?
    var deliveryFees: String?
    enum CodingKeys : String,CodingKey {
        case id,image,name,calories,duration,price,vat
        case numberOfDays = "number_of_days"
        case skipAbility = "skip_ability"
        case deliveryFees = "delivery_fees"
    }
}



// PlanData
struct PlanDataResponse: Codable {
    let message:String?
    var data: PlanData?
}
struct PlanData: Codable {
    let id: Int?
    var image: String?
    var name: String?
    var calories: String?
    var duration: String?
    var numberOfDays: String?
    var price: String?
    var vat: String?
    var total: String?
    var skipAbility: String?
    var deliveryFees: String?
    enum CodingKeys : String,CodingKey {
        case id,image,name,calories,duration,price,vat,total
        case numberOfDays = "number_of_days"
        case skipAbility = "skip_ability"
        case deliveryFees = "delivery_fees"
    }
}

// Days
struct Days: Codable {
    let message:String?
    var data: [Day]?
}
struct Day: Codable {
    let id: Int?
    var isSelected: Bool?
    let name: String?
    enum CodingKeys : String,CodingKey {
        case id,name
        case isSelected = "is_selected"
    }
}

// DelivaryTimes
struct DelivaryTimes: Codable {
    let message:String?
    var data: [DelivaryTime]?
}
struct DelivaryTime: Codable {
    let id: Int?
    let from: String?
    let to: String?
    let nightBefore: Int?
    let text: String?
    var isSelected: Bool?
    enum CodingKeys : String,CodingKey {
        case id,from,to,text
        case nightBefore = "night_before"
        case isSelected = "is_selected"
    }
}

// subscribe
struct SubscribeModel: Codable {
    let message:String?
    let errors: [String]?
}

// countries
struct Countries: Codable {
    let message:String?
    let data: [Country]?
}
struct Country: Codable {
    let id: Int?
    let image: String?
    let name: String?
    let phone_prefix: String?
}

// OrderSummary
struct OrderSummary: Codable {
    let message:String?
    let data: OrderSummaryData?
}
struct OrderSummaryData: Codable {
    let plan: String?
    let dietaryPlan: String?
    let deliveryDays: String?
    let deliveryTime: String?
    enum CodingKeys : String,CodingKey {
        case plan
        case dietaryPlan = "dietary_plan"
        case deliveryDays = "delivery_days"
        case deliveryTime = "delivery_time"
    }
}
// Address
struct Address: Codable {
    let message:String?
    let data: AddressData?
}
struct AddressData: Codable {
    let id:Int?
    let latitude: String?
    let longitude: String?
    let type: String?
    let block: String?
    let road: String?
    let building: String?
    let flat: String?
    let area: String?
    let note: String?
}


// Chat
struct Chat: Codable {
    let message:String?
    var data: Messages?
}
struct Messages: Codable {
    var messages: [MSG]?
    let listen: Bool?
}
struct MessageDetails: Codable ,ContentEquatable, ContentIdentifiable {
    var differenceIdentifier: String {
        return id
    }
    
    //This function is used to check if two messages are equal or not
    func isContentEqual(to source: MessageDetails) -> Bool {
        return id == source.id
    }

    var owner: Bool?
    var id: String
    var body: String?
}
struct MSG: Codable {

    let owner: Bool?
    let body: String?
}

struct SendMsg: Codable {
    let message:String?
    var data: MSG?
}

// HomeDays
struct HomeDays: Codable {
    let message:String?
    var data: [HomeDayContent]?
}
struct HomeDayContent: Codable {
    let id: Int?
    var isSelected: Bool?
    let time: String?
    let details: HomeDayDetails?
    enum CodingKeys : String,CodingKey {
        case id,time,details
        case isSelected = "is_selected"
    }
}
struct HomeDayDetails: Codable {
    let caloriesTitle:String?
    let caloriesPerDay:String?
    let startCaloriesRange:String?
    let endCaloriesRange:String?
    let proteinPerDay:String?
    let leftProtein:String?
    let carbPerDay:String?
    let leftCarbs:String?
    let fatPerDay:String?
    let leftFats:String?
    let locationType:String?
    let deliveryTime:String?
    let meals:[Meal]?

    enum CodingKeys : String,CodingKey {
        case meals
        case caloriesTitle = "calories_title"
        case caloriesPerDay = "calories_per_day"
        case startCaloriesRange = "start_calories_range"
        case endCaloriesRange = "end_calories_range"
        case proteinPerDay = "protein_per_day"
        case leftProtein = "left_protein"
        case carbPerDay = "carb_per_day"
        case leftCarbs = "left_carb"
        case fatPerDay = "fat_per_day"
        case leftFats = "left_fat"
        case locationType = "location_type"
        case deliveryTime = "delivery_time"
    }
    
}
struct Meal: Codable {
    let title: String?
    let imageUrl: String?
    let calories: String?
    let details: String?
    let protein: String?
    let fats: String?
    let carb: String?
    enum CodingKeys : String,CodingKey {
        case title,calories,details,protein,fats,carb
        case imageUrl = "image_url"
    }
}
// HomeDays
struct Payment: Codable {
    let message:String?
    var data: PaymentData?
}
struct PaymentData: Codable {
    let url:String?
    enum CodingKeys : String,CodingKey {
        case url = "payment_view_url"
    }
}
