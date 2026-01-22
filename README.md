# Flutter Multi-Feature Demo App

A Flutter application showcasing multiple core app features using **clean architecture and BLoC pattern**.  
This project demonstrates API integration, local JSON handling, state management, and basic game logic.

---

## Features Overview

The application contains **four independent modules**:

---

## Weather Forecast Module

### Features
- Fetches weather forecast data from a public API (OpenWeatherMap).
- Displays forecast data in a `ListView`.
- Allows users to select a city to view its weather forecast.
- Clean separation of **UI, BLoC, domain, and data layers**.

### Key Concepts Used
- REST API integration
- BLoC state management
- ListView & navigation
- Error and loading state handling

---

## To-Do List Module

### Features
- Add new to-do items
- Edit existing to-do items
- Delete to-do items
- Mark to-do items as completed
- Filter to-do items by status:
  - All
  - Completed
  - Pending

### Key Concepts Used
- CRUD operations
- BLoC pattern
- Local state management
- Reusable widgets
- Dialogs and forms

---

## Game Module (Tic-Tac-Toe)

### Features
- Simple Tic-Tac-Toe game
- Play against:
  - Computer (AI)
  - Another player (local multiplayer)
- Saves game progress locally
- Displays winner and draw states

### Key Concepts Used
- Game logic implementation
- Turn-based state handling
- Local persistence
- Custom UI components

---

## Products Module

### Features
- Loads product data from a local JSON file
- Displays products in a `ListView`
- Each product includes:
  - Title
  - Price
  - Image
- Tap on a product to view detailed information

### Key Concepts Used
- Local JSON parsing
- Model mapping
- Navigation with arguments
- Image loading from network

---

## Project Architecture

This project follows **Clean Architecture** with **BLoC**:

