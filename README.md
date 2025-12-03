# PhotoViewer

A SwiftUI-based iOS app that displays photos from [JSONPlaceholder API](https://jsonplaceholder.typicode.com) with smart caching and compression.

## Features

- 📱 Browse 5,000 photos in a smooth, scrollable list
- 🔍 View photo details with editable titles
- 💾 Intelligent LRU cache with Brotli compression
- 🚀 Async/await networking with proper error handling
- ⚡ Memory pressure monitoring and auto-cleanup
- ✅ Unit tested cache implementation

## Tech Stack

- **UI**: SwiftUI with NavigationStack
- **Architecture**: MVVM pattern
- **Networking**: URLSession with async/await
- **Caching**: Custom LRU cache with linked list
- **Compression**: Brotli algorithm for optimal storage
- **Concurrency**: Swift Concurrency (`@Sendable`, `@MainActor`)

## Requirements

- **Xcode**: 15.0+
- **iOS**: 15.0+

## Getting Started

1. Clone the repository
2. Open `PhotoViewer.xcodeproj` in Xcode
3. Select a simulator or device
4. Run the project (`Cmd + R`)

## Architecture Highlights

- **Protocol-driven design** for testability and flexibility
- **Automatic memory management** with cache eviction on memory pressure
- **Image compression** reduces memory footprint by ~60-80%
- **Dependency injection** for easy testing and mocking
