import Foundation
import SwiftData

@Model
class TransactionsModel: Identifiable, Codable {
    @Attribute(.unique) var accountId: String
    var companyName: String
    var amount: Amount
    var creditDebitIndicator: String
    var datetime: String
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id", companyName = "company_name", amount, creditDebitIndicator = "credit_debit_indicator", datetime
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accountId = try container.decode(String.self, forKey: .accountId)
        companyName = try container.decode(String.self, forKey: .companyName)
        amount = try container.decode(Amount.self, forKey: .amount)
        creditDebitIndicator = try container.decode(String.self, forKey: .creditDebitIndicator)
        datetime = try container.decode(String.self, forKey: .datetime)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(accountId, forKey: .accountId)
        try container.encode(companyName, forKey: .companyName)
        try container.encode(amount, forKey: .amount)
        try container.encode(creditDebitIndicator, forKey: .creditDebitIndicator)
        try container.encode(datetime, forKey: .datetime)
    }
}

@Model
class Amount: Identifiable, Codable {
    var amount: String
    var currency: String
    
    var currencyFullName: String {
        switch currency {
        case "USD":
            return "USDollar"
        case "EUR":
            return "Euro"
        case "GBP":
            return "British Pound"
            // Add more cases as needed for other currencies
        default:
            return currency // Default to returning the currency code itself if no transformation is defined
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case amount, currency
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        amount = try container.decode(String.self, forKey: .amount)
        currency = try container.decode(String.self, forKey: .currency)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(currency, forKey: .currency)
    }
}
