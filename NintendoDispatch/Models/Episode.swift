//
//  Episode.swift
//  NintendoDispatch
//
//  Created by Work on 29/11/2019.
//  Copyright © 2019 Limit Break Technology Ltd. All rights reserved.
//
//   let podcasts = try? newJSONDecoder().decode(Podcasts.self, from: jsonData)

import Foundation

// MARK: - Podcasts
struct Podcasts: Codable {
    var version: String
    var title: String
    var homePageURL, feedURL: String
    var podcastsDescription: String
    var fireside: Fireside
    var items: [Item]

    enum CodingKeys: String, CodingKey {
        case version, title
        case homePageURL = "home_page_url"
        case feedURL = "feed_url"
        case podcastsDescription = "description"
        case fireside = "_fireside"
        case items
    }
}

// MARK: - Fireside
struct Fireside: Codable {
    var subtitle, pubdate: String
    var explicit: Bool
    var copyright, owner: String
    var image: String
}

// MARK: - Item
struct Item: Codable, Identifiable {
    var id, title: String
    var url: String
    var contentText, contentHTML, summary, datePublished: String
    var attachments: [Attachment]

    enum CodingKeys: String, CodingKey {
        case id, title, url
        case contentText = "content_text"
        case contentHTML = "content_html"
        case summary
        case datePublished = "date_published"
        case attachments
    }
}

// MARK: - Attachment
struct Attachment: Codable {
    var url: String
    var mimeType: MIMEType
    var sizeInBytes, durationInSeconds: Int

    enum CodingKeys: String, CodingKey {
        case url
        case mimeType = "mime_type"
        case sizeInBytes = "size_in_bytes"
        case durationInSeconds = "duration_in_seconds"
    }
}

enum MIMEType: String, Codable {
    case audioMPEG = "audio/mpeg"
    case audioMp3 = "audio/mp3"
}
