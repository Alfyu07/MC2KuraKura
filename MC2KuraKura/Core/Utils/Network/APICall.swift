//
//  APICall.swift
//  MC2KuraKura
//
//  Created by Wahyu Alfandi on 31/05/23.
//

import Foundation

struct API {
    // https://3.1.211.225/api/v1/
    
    static let baseUrl = "https://3.1.211.225/api/v1/"
}

protocol Endpoint {
    var url: String {get}
}
enum Endpoints {
    
    enum Gets: Endpoint {
        case signup
        case user
        case meetings
        case meeting
        case share
        case vote
        case search
        
        public var url: String {
            switch self {
            case .signup: return "\(API.baseUrl)signup"
            case .user: return "\(API.baseUrl)user"
            case .meetings: return "\(API.baseUrl)user/meetings"
            case .meeting: return "\(API.baseUrl)meeting"
            case .share: return "\(API.baseUrl)share"
            case .vote: return "\(API.baseUrl)lookup.php?i="
            case .search: return "\(API.baseUrl)search.php?s="
            }
        }
    }
    
}
