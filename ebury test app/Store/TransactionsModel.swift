import Foundation
import SwiftData

@Model
class TransactionsModel: Identifiable, Codable {
    @Attribute(.unique) var accountId: String
    var companyName: String
    var amount: Amount
    var creditDebitIndicator: String
    var datetime: String
    
    // CodingKeys enum is used to map JSON keys to property names
    enum CodingKeys: String, CodingKey {
        // Custom mapping of JSON keys to model properties
        case accountId = "account_id"
        case companyName = "company_name"
        case amount
        case creditDebitIndicator = "credit_debit_indicator"
        case datetime
    }
    required init(accountId: String, companyName: String, amount: Amount, creditDebitIndicator: String, datetime: String) {
        self.accountId = accountId
        self.companyName = companyName
        self.amount = amount
        self.creditDebitIndicator = creditDebitIndicator
        self.datetime = datetime
    }
    
    // Required initializer to decode JSON into the model properties
    required init(from decoder: Decoder) throws {
        // Create a container using the CodingKeys enum
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Decode each property from the container using the corresponding key
        accountId = try container.decode(String.self, forKey: .accountId)
        companyName = try container.decode(String.self, forKey: .companyName)
        amount = try container.decode(Amount.self, forKey: .amount)
        creditDebitIndicator = try container.decode(String.self, forKey: .creditDebitIndicator)
        datetime = try container.decode(String.self, forKey: .datetime)
    }
    
    // Method to encode the model properties into JSON
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        // Encode each property into the container using the corresponding key
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
        case "USD", "usd":
            return "US Dollar"
        case "EUR":
            return "Euro"
        case "GBP":
            return "British Pound"
            // Add more cases as needed for other currencies
        default:
            return currency.uppercased() // Default to returning the currency code itself if no transformation is defined
        }
    }
    
    required init(amount: String, currency: String) {
            self.amount = amount
            self.currency = currency
            
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
