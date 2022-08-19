import Foundation

public struct Note {
    private let name: String
    private let deathDate: Date
    private let description: String?
    
    init(name: String, dateString: String, description: String?) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        self.init(name: name, date: formatter.date(from: dateString)!, description: description)
    }
    
    init(name: String, date: Date, description: String?) {
        self.name = name
        self.deathDate = date
        self.description = description
    }
    
    init(name: String, dateString: String) {
        self.init(name: name, dateString: dateString, description: nil)
    }
    
    func getName()->String {
        return name
    }
    
    func getDeathDateString()->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        return formatter.string(from: deathDate)
    }
    
    func getDeathDate()->Date {
        return deathDate
    }
    
    func getDescription()->String {
        if let d = description {
            return d
        } else {
            return ""
        }
    }
}
