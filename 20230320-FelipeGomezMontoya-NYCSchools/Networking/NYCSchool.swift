//
//  NYCSchool.swift
//  20230320-FelipeGomezMontoya-NYCSchools
//
//  Created by Felipe Gomez on 3/20/23.
//

import Foundation

struct NYCSchool: Decodable, Identifiable {
    let dbn: String
    let schoolName: String?
    
    let primaryAddressLine1: String?
    let city: String?
    let zip: String?
    let stateCode: String?
    
    let overviewParagraph: String?
    let website: String?
    let phoneNumber: String?
    
    var id: String { dbn }
    
    static func mock() -> NYCSchool {
        NYCSchool(dbn: "02M260",
                  schoolName: "Clinton School Writers & Artists, M.S. 260",
                  primaryAddressLine1: "10 East 15th Street",
                  city: "Manhattan",
                  zip: "10003",
                  stateCode: "NY",
                  overviewParagraph: "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities.",
                  website: "www.theclintonschool.net",
                  phoneNumber: "212-524-4360")
    }
}
