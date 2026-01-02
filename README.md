# 📰 News Portal - Flutter News App

## 📌 Introduction
News Portal is a modern, responsive mobile application built with Flutter that keeps users informed with the latest news from around the world. 
The app aggregates trending news, hottest articles, and curated content across multiple categories, providing a seamless and engaging reading experience.

---

## 📋 Overview
News Portal is designed to provide users with a fast, intuitive, and visually appealing way to stay updated with global news. 
The app aggregates news articles from multiple sources and presents them in an organized layout that emphasizes both readability and accessibility.

---

## 🎯 Features
News Portal comes packed with a variety of user-friendly features designed to keep readers informed and engaged:
### 📰 Hottest News Slider
- Dynamic carousel that showcases the top headlines
- Swipe through the most important stories with smooth animations

### 🔥 Trending News
- Displays news articles that are currently gaining popularity
- Quick access to what's trending worldwide

### 🗂 Explore Cateogories
- Browse news by topics such as Technology, Sports, Entertainment, Health, and more
- Tap on a category to discover related articles

### 🌐 In-App WebView
- Open and read full articles without leaving the app
- Provides a seamless reading experience

 ### ✨ Shimmer Loading
 - Skeleton placeholder effects while content loads
 - Improves perceived performance and smoothens the user experience

### 🌙 Dark Mode Support
- Automatically adapts the interface based on device theme
- Provides a comfortable reading experience at night

 ### 🔄 Pull-to-Refresh
 - Easily refresh the news feed to get the latest updates
 - Keeps content up-to-date with a simple swipe gesture

 ### 📱 Responsive Design
 - Optimized for different screen sizes on both Android and iOS devices
 - Ensures consistent and visually appealing layout

---

## 🔍 My Approach
The development of News Portal focused on speed, usability, and modularity. The app is built to provide users with instant access to the latest news while maintaining a smooth and responsive experience. Key aspects of the approach include:
- **Modular Architecture:** Each feature, such as trending news, slider, and categories, is implemented as a separate widget for maintainability and scalability.
- **User-Centered Design:** Prioritized easy navigation, readable layouts, and quick access to popular stories.
- **Performance Optimization:** Shimmer loading effects, lazy loading of content, and optimized widgets reduce perceived loading time and improve responsiveness.

 ---

## 🧰 Tools & Libraries Used
News Portal is developed using Flutter, with the following tools and libraries:
- **Flutter & Dart:** Cross-platform mobile development framework.
- **get:** For easy navigation and state management.
- **flutter_inappwebview:** To display full news articles in an in-app browser.
- **carousel_slider:** To create the Hottest News carousel with smooth animations.
- **smooth_page_indicator:** For animated page indicators under the carousel.
- **shimmer:** To show skeleton placeholders while content is loading.
- **http / REST API:** For fetching news data from various sources.

These tools collectively ensure the app is fast, modern, and maintainable.

---

## 🧭 How It Works
The app follows a **Clean Architecture pattern**, separating code into three main layers


### 1️⃣ Fetching Data:
- The app fetches news articles and slider data from APIs or local data sources.
- Data is categorized into “Hottest News,” “Trending News,” and specific categories.

### 2️⃣ Displaying Content:
- Shimmer placeholders appear while the data is being fetched.
- Once loaded, content is displayed using ListView and CarouselSlider widgets.

### 3️⃣ Navigation & Interaction:
- Users can scroll through trending news or swipe through the hottest news carousel.
- Tapping a news article opens the full content in an in-app WebView, keeping the user inside the app.
- Pull-to-refresh allows users to get the latest updates instantly.

 ### 4️⃣ Dynamic UI:
 - The app supports dark mode based on device settings.
 - Responsive layouts ensure a seamless experience across various devices and screen sizes.

---

## 📱 App Preview

### Home Screen
![Home_Screen](https://github.com/zoh01/news_portal/blob/07a2e84a3900a58852bfe892c78dc65c570f0fc0/home_screen.jpeg)

### Hottest Screen
![Hottest_Screen](https://github.com/zoh01/news_portal/blob/07a2e84a3900a58852bfe892c78dc65c570f0fc0/hottest_screen.jpeg)

### Trending News
![Trending_News](https://github.com/zoh01/news_portal/blob/07a2e84a3900a58852bfe892c78dc65c570f0fc0/trending_news.jpeg)

### In-App WebView
![In-App_WebView](https://github.com/zoh01/news_portal/blob/07a2e84a3900a58852bfe892c78dc65c570f0fc0/webview_screen.jpeg)

### Technology Screen
![Technology_Screen](https://github.com/zoh01/news_portal/blob/07a2e84a3900a58852bfe892c78dc65c570f0fc0/technology_screen.jpeg)

### Science Screen
![Technology_Screen](https://github.com/zoh01/news_portal/blob/07a2e84a3900a58852bfe892c78dc65c570f0fc0/sport_screen.jpeg)

### Entertainment Screen
![Technology_Screen](https://github.com/zoh01/news_portal/blob/07a2e84a3900a58852bfe892c78dc65c570f0fc0/entertainment_screen.jpeg)

---

## 📂 Project Structure
  
    lib/
     ├── features/
     │     ├── data/             # Handles API fetching, slider data, news data
     │     ├── domain/           # Models (ArticleModels, SliderModel, CategoryModel, etc.)
     │     ├── presentation/     # UI screens & widgets (home, slider, trending, explore, news view, etc.)
     ├── utils/                  # Constants (colors, sizes), helper functions, device utilities
     ├── main.dart               # Entry point of the app
    pubspec.yaml                 # Flutter dependencies and assets
    README.md                    # Project documentation
This separation ensures maintainability and easier scalability as the app grows.

---

## 🛠️ Getting Started
### Prerequisites
- Flutter SDK installed
- A valid news API / backend service to fetch news data
- Internet connection (for fetching news & loading full articles)

### Run locally
**STEPS TO RUN**
1. Clone the repository:

       git clone https://github.com/zoh01/news_portal.git
2. Enter project folder
   ```bash
   cd news_portal
3. Get dependencies
   ```bash
   flutter pub get
4. Run the app
   ```bash
   flutter run
⚙️ If you are using an API key or environment variables, make sure to configure them before running.

--- 

## Future Enhancement & Ideas
Here are some potential upgrades to make this project even more powerful:
- **🔖 Bookmark / Save Articles:** allow users to save interesting news for later reading.
- **🌙 Manual Theme Toggle:** let users switch between light and dark mode.
- **🔔 Push Notifications:** notify users of breaking news or trending stories.
- **📡 Offline Mode / Caching:** cache articles for offline reading (especially useful for low-data users).
- **🔍 Search Functionality:** search by keywords, authors, or categories.
- **🌍 Multi-language Support:** enable news in different languages.
- **📐 Responsive Web Version:** extend support beyond mobile to web browsers.
- **🧪 Testing:** add unit tests / widget tests for reliability and maintenance.

---

## 👤 **Author / Contact** section  

## 👤 Author
**Adebayo Wariz**  

## 📧 Contact
Whatsapp: +234 702 513 6608

Email: adebayozoh@gmail.com

LinkedIn: https://www.linkedin.com/in/adebayo-wariz-a8ab9a310/

GitHub: [https://github.com/zoh01](https://github.com/zoh01)

---

## 📄 License
This project is licensed under the MIT License.
```bash
```bash
MIT License

Copyright (c) 2025 [Adebayo Wariz]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
