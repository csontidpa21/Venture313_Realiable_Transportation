import Foundation
import AVFoundation
import AppKit
import CoreVideo

struct Segment {
    let image: String
    let narration: String
}

let workspace = "/Users/csontidpa21/Documents/Hackathon"
let slides = "\(workspace)/presentation-build/template-version"
let output = "\(workspace)/presentation-output"
let work = "\(workspace)/video-pitch/work"
let finalURL = URL(fileURLWithPath: "\(output)/Carpool_Venture313_Video_Pitch.mp4")
let silentURL = URL(fileURLWithPath: "\(work)/visuals.mov")

let segments: [Segment] = [
    Segment(image: "\(slides)/slide-1.png", narration: """
    Good morning. I am Mac Sontidpanya, and this is Carpool, a route based ride sharing app built for Detroit. Carpool helps people find a lower cost ride by matching them with drivers who are already traveling in the same direction. Instead of requesting a private car, a rider joins a trip that is already planned. The driver can fill an empty seat, share part of the trip cost, and decide how much extra time the pickup adds. Our focus is reliable transportation, infrastructure, and sustainability. We started with one everyday Detroit problem: what happens when someone still needs to reach work, school, training, or an appointment, but their usual vehicle is suddenly unavailable?
    """),
    Segment(image: "\(slides)/slide-2.png", narration: """
    Carpool is designed around Detroit residents and the organizations they already trust. I am building the product and leading the project. The first users we want to serve are students, trainees, shift workers, and families. The first partners could be schools, colleges, employers, youth programs, and neighborhood organizations. These partners matter because transportation depends on trust. A small pilot connected to a known organization can help people recognize the driver, understand the trip rules, and report problems. The product can eventually serve many kinds of riders, but the first version stays focused: help a defined Detroit group coordinate repeat trips to places they already need to go.
    """),
    Segment(image: "\(slides)/slide-3.png", narration: """
    The problem came from a specific rider situation. Someone works a late shift near the airport. Their vehicle is in a repair shop. The bus stops running before the shift ends, and a private rideshare every night costs too much. That person may depend on scattered text messages, favors from relatives, or a last minute search after work. The same gap affects an early morning class, a training program, or a medical appointment when the transit schedule does not fit. Detroit already has drivers making many of these trips with empty seats. Riders also need to travel along those same corridors. The missing piece is a simple way to connect them while keeping the driver in control of the route, timing, pickup, and added travel time.
    """),
    Segment(image: "\(slides)/slide-4.png", narration: """
    Carpool uses a simple three step flow. First, a driver posts a trip they already plan to make, including the destination, departure time, and available seats. Second, the app finds riders whose pickup and destination fit that existing path. Third, the driver reviews the matches, chooses the riders, and agrees on the pickup details. Riders contribute toward the trip, which can make the cost lower than ordering a private rideshare. The route comes first, so the product does not send a car across the city just to begin a trip. The app also connects people to official MDOT and SMART information when public transit is the better part of the journey. The goal is a practical network that combines shared rides with the transportation options Detroit already has.
    """),
    Segment(image: "\(slides)/slide-5.png", narration: """
    Here is the working prototype. The current product supports a planned route, an interactive departure date and time, and a seat selector from one to ten seats. It shows riders who are already along the route and links to official transit tools. This first version is intentionally small. It demonstrates the core matching idea without pretending that every safety, payment, insurance, or legal question has already been solved. The pilot roadmap adds verified profiles and invitations through trusted organizations. Later versions can add payments, alerts, accessibility options, better route calculations, and a dashboard that helps a partner understand whether people are completing trips safely and on time.
    """),
    Segment(image: "\(output)/app-home.png", narration: """
    In the live app, the driver begins with the trip they are already taking. This example starts in Grandmont and travels to Detroit Metro Airport at seven in the morning. The driver has ten open seats, which also allows the experience to represent a van, shuttle, or larger shared vehicle. The driver can change the locations, departure time, and capacity directly on the page. The design keeps the task clear: share the route, split the cost, and choose the riders, detour, and pickup. When the driver selects Find Riders, the app looks for compatible people instead of treating every request as a separate private trip.
    """),
    Segment(image: "\(output)/app-riders.png", narration: """
    The match results make the tradeoffs visible. Each rider card shows the pickup, destination, added detour time, luggage or profile information, and the proposed trip share. In this example, Maya adds four minutes, Derrick adds seven, and Keisha adds nine. The driver can compare those details before selecting anyone. That choice is important. A useful match has to respect the driver's schedule and the rider's need for a dependable arrival. During a pilot, verified profiles and organization invitations would add another layer of trust. We would also test clear cancellation rules, emergency contacts, reporting, and accessibility needs before expanding beyond a controlled group.
    """),
    Segment(image: "\(output)/app-trip-share.png", narration: """
    After the driver selects two riders, the app summarizes the result. In this demonstration, the selected riders can share twenty six dollars of the trip. No booking or charge happens in the current prototype. That message is deliberate because the demo tests route matching and user understanding first. The same page points people toward official Michigan transit information and SMART tools, so a rider can compare the shared trip with a bus or combine both options. The next product test is straightforward: can people understand the match, agree on a pickup, complete the trip, and choose Carpool again when the route repeats?
    """),
    Segment(image: "\(slides)/slide-6.png", narration: """
    If Detroit adopts this approach through a pilot, we can measure the impact without relying on broad claims. We will track completed rides and on time arrivals. We will compare the rider's contribution with a same time private rideshare quote. We will monitor repeat use, cancellations, and safety reports. Those measures tell us whether the service actually improves access and whether drivers continue offering seats. The first pilot should stay connected to one trusted Detroit cohort, such as a school, training program, employer, or youth organization. If the model works, another city could reuse the route matching product, but each place would still need local partners, transit connections, safety rules, and a clear understanding of the people it intends to serve.
    """),
    Segment(image: "\(slides)/slide-7.png", narration: """
    Our proposed ninety day pilot starts with three partner sites, one hundred fifty invited riders, and twenty five drivers. These are pilot targets, not results we have already achieved. The first goal is to learn whether a trusted group can create enough repeat routes for useful matches. Possible business models include a small completed ride fee, a sponsored pilot, or an organization contract. Before choosing one, we need evidence that riders save money, drivers accept the added time, and partners see better attendance or fewer transportation related absences. Today we have a working clickable prototype and a clear rider scenario. What we need next are introductions to Detroit pilot partners, potential participants, and advisors who can help us design safe operating rules.
    """),
    Segment(image: "\(slides)/slide-1.png", narration: """
    Carpool starts with a simple idea: a reliable ride may already be passing nearby. By helping Detroit drivers share planned routes with people who need them, we can lower individual trip costs, use available seats, and give residents another option when a car or transit schedule cannot cover the journey. Thank you. I am Mac Sontidpanya, and I welcome your questions.
    """)
]

func run(_ executable: String, _ arguments: [String]) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: executable)
    process.arguments = arguments
    try process.run()
    process.waitUntilExit()
    if process.terminationStatus != 0 {
        throw NSError(domain: "PitchVideo", code: Int(process.terminationStatus), userInfo: [NSLocalizedDescriptionKey: "Command failed: \(executable)"])
    }
}

func audioDuration(_ url: URL) -> Double {
    let asset = AVURLAsset(url: url)
    return CMTimeGetSeconds(asset.duration)
}

func makePixelBuffer(pool: CVPixelBufferPool, current: CGImage, next: CGImage?, progress: Double, frameProgress: Double, width: Int, height: Int) -> CVPixelBuffer? {
    var pixelBuffer: CVPixelBuffer?
    CVPixelBufferPoolCreatePixelBuffer(nil, pool, &pixelBuffer)
    guard let buffer = pixelBuffer else { return nil }
    CVPixelBufferLockBaseAddress(buffer, [])
    defer { CVPixelBufferUnlockBaseAddress(buffer, []) }
    guard let base = CVPixelBufferGetBaseAddress(buffer) else { return nil }
    let bytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
    guard let context = CGContext(data: base, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue) else { return nil }
    context.setFillColor(NSColor.black.cgColor)
    context.fill(CGRect(x: 0, y: 0, width: width, height: height))
    func draw(_ image: CGImage, alpha: CGFloat, zoom: CGFloat) {
        let iw = CGFloat(image.width), ih = CGFloat(image.height)
        let canvasW = CGFloat(width), canvasH = CGFloat(height)
        let scale = max(canvasW / iw, canvasH / ih) * zoom
        let drawW = iw * scale, drawH = ih * scale
        let rect = CGRect(x: (canvasW - drawW) / 2, y: (canvasH - drawH) / 2, width: drawW, height: drawH)
        context.saveGState()
        context.setAlpha(alpha)
        context.draw(image, in: rect)
        context.restoreGState()
    }

    let zoom = CGFloat(1.0 + min(frameProgress, 1.0) * 0.018)
    draw(current, alpha: 1.0, zoom: zoom)
    if let next, progress > 0 {
        draw(next, alpha: CGFloat(progress), zoom: 1.0)
    }
    return buffer
}

@main
struct PitchRenderer {
    static func main() async throws {
        try FileManager.default.createDirectory(atPath: work, withIntermediateDirectories: true)
        if FileManager.default.fileExists(atPath: finalURL.path) { try FileManager.default.removeItem(at: finalURL) }
        if FileManager.default.fileExists(atPath: silentURL.path) { try FileManager.default.removeItem(at: silentURL) }

        var audioURLs: [URL] = []
        var durations: [Double] = []
        for (index, segment) in segments.enumerated() {
            let url = URL(fileURLWithPath: String(format: "%@/narration-%02d.aiff", work, index + 1))
            if FileManager.default.fileExists(atPath: url.path) { try FileManager.default.removeItem(at: url) }
            try run("/usr/bin/say", ["-v", "Samantha", "-o", url.path, "[[rate 190]] " + segment.narration])
            audioURLs.append(url)
            durations.append(audioDuration(url) + 0.65)
        }

        let width = 1920, height = 1080, fps: Int32 = 5
        let writer = try AVAssetWriter(outputURL: silentURL, fileType: .mov)
        let videoSettings: [String: Any] = [
            AVVideoCodecKey: AVVideoCodecType.h264,
            AVVideoWidthKey: width,
            AVVideoHeightKey: height,
            AVVideoCompressionPropertiesKey: [
                AVVideoAverageBitRateKey: 5_000_000,
                AVVideoMaxKeyFrameIntervalKey: Int(fps * 5),
                AVVideoProfileLevelKey: AVVideoProfileLevelH264HighAutoLevel
            ]
        ]
        let input = AVAssetWriterInput(mediaType: .video, outputSettings: videoSettings)
        let adaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: input, sourcePixelBufferAttributes: [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
            kCVPixelBufferWidthKey as String: width,
            kCVPixelBufferHeightKey as String: height
        ])
        writer.add(input)
        writer.startWriting()
        writer.startSession(atSourceTime: .zero)
        guard let pool = adaptor.pixelBufferPool else { throw NSError(domain: "PitchVideo", code: 2) }

        let cgImages: [CGImage] = try segments.map { segment in
            guard let image = NSImage(contentsOfFile: segment.image), let cg = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
                throw NSError(domain: "PitchVideo", code: 3, userInfo: [NSLocalizedDescriptionKey: "Cannot load \(segment.image)"])
            }
            return cg
        }

        var frameNumber: Int64 = 0
        for index in segments.indices {
            let seconds = durations[index]
            let frames = Int(ceil(seconds * Double(fps)))
            for localFrame in 0..<frames {
                while !input.isReadyForMoreMediaData { Thread.sleep(forTimeInterval: 0.004) }
                let localSeconds = Double(localFrame) / Double(fps)
                let transition = index < segments.count - 1 ? max(0, min(1, (localSeconds - seconds + 0.55) / 0.55)) : 0
                let progress = localSeconds / max(seconds, 0.1)
                guard let buffer = makePixelBuffer(pool: pool, current: cgImages[index], next: index < cgImages.count - 1 ? cgImages[index + 1] : nil, progress: transition, frameProgress: progress, width: width, height: height) else {
                    throw NSError(domain: "PitchVideo", code: 4)
                }
                adaptor.append(buffer, withPresentationTime: CMTime(value: frameNumber, timescale: fps))
                frameNumber += 1
            }
        }
        input.markAsFinished()
        await writer.finishWriting()
        guard writer.status == .completed else { throw writer.error ?? NSError(domain: "PitchVideo", code: 5) }

        let composition = AVMutableComposition()
        let visualAsset = AVURLAsset(url: silentURL)
        let visualTracks = try await visualAsset.loadTracks(withMediaType: .video)
        guard let sourceVideo = visualTracks.first,
              let videoTrack = composition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid) else {
            throw NSError(domain: "PitchVideo", code: 6)
        }
        let visualDuration = try await visualAsset.load(.duration)
        try videoTrack.insertTimeRange(CMTimeRange(start: .zero, duration: visualDuration), of: sourceVideo, at: .zero)

        guard let audioTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid) else {
            throw NSError(domain: "PitchVideo", code: 7)
        }
        var cursor = CMTime.zero
        for (index, url) in audioURLs.enumerated() {
            let asset = AVURLAsset(url: url)
            let tracks = try await asset.loadTracks(withMediaType: .audio)
            if let track = tracks.first {
                let duration = try await asset.load(.duration)
                try audioTrack.insertTimeRange(CMTimeRange(start: .zero, duration: duration), of: track, at: cursor)
            }
            cursor = CMTimeAdd(cursor, CMTime(seconds: durations[index], preferredTimescale: 600))
        }

        guard let exporter = AVAssetExportSession(asset: composition, presetName: AVAssetExportPresetHighestQuality) else {
            throw NSError(domain: "PitchVideo", code: 8)
        }
        try await exporter.export(to: finalURL, as: .mp4)
        print("Created \(finalURL.path)")
        print(String(format: "Duration: %.1f seconds", CMTimeGetSeconds(composition.duration)))
    }
}
