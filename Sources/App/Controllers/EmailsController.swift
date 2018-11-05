//
//  EmailsController.swift
//  Letterer/Emails
//
//  Created by Marcin Czachurski on 04/11/2018.
//

import Foundation
import Vapor
import SendGrid

/// Controls basic operations for Email object.
final class EmailsController: RouteCollection {

    func boot(router: Router) throws {
        router.post(EmailDto.self, at: "/emails", use: send)
    }

    // Send email.
    func send(request: Request, emailDto: EmailDto) throws -> Future<HTTPResponseStatus> {

        let from = emailDto.from ?? EmailAddressDto(address: "donotrespond@letterer.me", name: "Letterer Bot")
        let replyTo = emailDto.replyTo ?? EmailAddressDto(address: "donotrespond@letterer.me", name: "Letterer Bot")

        let email = SendGridEmail(personalizations: [Personalization(to: [EmailAddress(email: emailDto.to.address, name: emailDto.to.name)])],
                                  from: EmailAddress(email: from.address, name: from.name),
                                  replyTo: EmailAddress(email: replyTo.address, name: replyTo.name),
                                  subject: emailDto.title,
                                  content: [
                                    [
                                        "type": "text/html",
                                        "value": emailDto.body
                                    ]
                                  ])

        let sendGridClient = try request.make(SendGridClient.self)
        return try sendGridClient.send([email], on: request.eventLoop).transform(to: HTTPStatus.ok)
    }
}
