//
//  HttpRequest.swift
//  UpMyCoin
//
//  Created by Min on 2021/02/27.
//

import Alamofire

struct HttpRequest {
    var url = ""
    var method: HttpMethod = .get
    var parameters: [String: Any]?
    var headers: HttpHeaders?
    var encoding: HttpEncoding?

    var alamofireMethod: HTTPMethod {
        return method.toAlamofire
    }

    var alamofireEncoding: ParameterEncoding {
        return encoding?.toAlamofire ?? HttpEncoding.jsonDefault.toAlamofire
    }
    
    var alamofireHeaders: HTTPHeaders {
        return headers?.toAlamofire ?? HttpHeaders.default.toAlamofire
    }
    
    init(url: String = "",
         method: HttpMethod = .get,
         parameters: [String: Any]? = nil,
         headers: HttpHeaders? = nil,
         encoding: HttpEncoding? = nil) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.encoding = encoding
    }
}

enum HttpMethod {
    case get
    case post
    case delete
    case put
    
    var toAlamofire: HTTPMethod {
        switch self {
        case .get: return HTTPMethod.get
        case .post: return HTTPMethod.post
        case .delete: return HTTPMethod.delete
        case .put: return HTTPMethod.put
        }
    }
}

enum HttpEncoding {
    case urlDefault
    case urlQuery
    case jsonDefault
    
    var toAlamofire: ParameterEncoding {
        switch self {
        case .urlDefault:
            return URLEncoding.default
        case .urlQuery:
            return URLEncoding.queryString
        case .jsonDefault:
            return JSONEncoding.default
        }
    }
}

enum HttpHeaders {
    case `default`
    
    var toAlamofire: HTTPHeaders {
        switch self {
        case .default:
            return ["Content-Type": "application/json"]
        }
    }
    
}
