//
//  mainModel.swift
//  haDer
//
//  Created by 10 on 4/23/20.
//  Copyright © 2020 com.kamal. All rights reserved.
//

import Foundation
import Alamofire

struct mainModel{
    
    // heb3Z2rM5RAiBO2KvtEFh3xXbUaH5SXEKTvh4lWm
    
    static let mainURL = "http://testing.sheco-eg.com/public/api/"
    
    static let signUpSendEmail = "token"              // email
    static let fitnessGoals = "fitness-goals"
    static let genders = "genders"
    static let categories = "categories"
    static let userActivities = "user-activities"
    static let dietary = "dietary-plans"
    static let profile = "profile"
    static let calculateResults = "calculate-results"
    static let meals = "meals"
    static let plans = "plans"
    static let days = "days"
    static let deliveryTimes = "delivery-times/"
    static let subscribe = "subscribe"
    static let countries = "countries"
    static let address = "address"
    static let completeProfile = "complete-profile"
    static let orderSummary = "address"
    static let verifyNumber = "verify-number"
    static let faqs = "faqs"
    static let searchFaqs = "search-faqs"
    static let helpImage = "help-image"
    static let login = "login"
    static let verifyLogin = "login-verify"
    static let updateProfile = "update-profile"
    static let updateProfileImage = "update-profile-image"
    static let updateNumber = "update-number"
    static let updateDeliveryTime = "update-delivery-time"
    static let updateDietaryPlan = "update-dietary-plan"
    static let updateCategories = "update-categories"
    static let sendMessage = "send-message"
    static let chat = "chat"
    static let home = "home-details"
    static let startPayment = "payment"
    static let endPayment = "check-payment"


    var path: String!
    var headers : HTTPHeaders = [
        "Content-Type" :"application/json"
        ,"Accept" :"application/json"
    ]
    var parameters = [String: Any]()
    var encoding : ParameterEncoding = JSONEncoding(options: [])
    var method : HTTPMethod = .post
    var images = [String: UIImage]()
    
}
