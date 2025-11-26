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
