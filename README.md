# 🎉 Numbers API Android App 📱✨  

This is a simple and fun Android app built with Dart and Flutter 🐦 that fetches **cool facts** about numbers using the [Numbers API](http://numbersapi.com) 🌟. The app delivers trivia, math, date, and year facts 🤓 in a clean and interactive interface.  

---

## ✨ Features ✨  

- 🔢 **Number Facts**: Discover trivia, mathematical, date-related, and historical facts about numbers!  
- 🎲 **Random Facts**: Feeling lucky? Get a random fact when you don’t provide a number!  
- 🔍 **Search Interface**: Enter a specific number and fetch its unique fact!  
- 🖼️ **Beautiful UI**: A sleek, responsive design for an enjoyable user experience 💖.  
- 📶 **Offline Mode**: No internet? No problem! Cached facts are available offline 🚀.  

---

## 📸 Screenshots  

*Add screenshots of your app here to make it pop! 🖼️*  

---

## 🚀 Getting Started  

### 🛠️ Prerequisites  

Make sure you have the following ready:  
- 🌟 **Flutter SDK**: Install it [here](https://flutter.dev/docs/get-started/install).  
- 🐦 **Dart**: Pre-installed with Flutter SDK.  
- 🖥️ **Android Studio**: Build and run the app on Android devices or emulators.  

### 🔧 Installation  

1️⃣ Clone the repository to your local machine 🖥️:  
**`git clone https://github.com/your-username/numbers-api-android-dart.git`**  

2️⃣ Navigate into the project folder 📂:  
**`cd numbers-api-android-dart`**  

3️⃣ Install the dependencies 📦:  
**`flutter pub get`**  

4️⃣ Run the app on your device or emulator 📱:  
**`flutter run`**  

---

## 🎮 How to Use  

1️⃣ Open the app on your Android device 📱.  
2️⃣ Enter a number in the search bar 🔢 or leave it empty for a random fact 🎲.  
3️⃣ Choose the type of fact you want: Trivia 🧠, Math ➕, Date 📅, or Year 📜.  
4️⃣ Tap the **"Fetch Fact"** button to reveal the fun fact! 🎉  

---

## 🌐 API Reference  

The app uses the **[Numbers API](http://numbersapi.com)** to fetch all the amazing data! ✨  

- 🎯 **Trivia**: `http://numbersapi.com/{number}/trivia`  
- ➕ **Math**: `http://numbersapi.com/{number}/math`  
- 📅 **Date**: `http://numbersapi.com/{month}/{day}/date`  
- 📜 **Year**: `http://numbersapi.com/{year}/year`  

---

## 📂 Project Structure  

Here's how the app is organized:  

```
lib/  
├── main.dart       # Main entry point  
├── screens/        # UI screens  
│   ├── home.dart   # Home screen  
│   ├── result.dart # Result display screen  
├── services/       # API integration  
│   ├── numbers_api.dart  # Handles API calls  
└── widgets/        # Reusable UI components  
```

---

## 📦 Dependencies  

This app uses the following awesome Flutter/Dart packages:  

- 🌐 **http**: For API requests.  
- 🔄 **provider**: To manage state.  
- ✨ **flutter_spinkit**: For loading animations.  
- 💾 **shared_preferences**: To cache facts locally.  

---

## 🤝 Contributing  

💡 Got ideas? Contributions are welcome! Here's how you can help:  

1️⃣ Fork the repository 🍴.  
2️⃣ Create a feature branch 🔧: `git checkout -b feature-name`.  
3️⃣ Commit your changes 💾: `git commit -m "Add feature-name"`.  
4️⃣ Push to your branch 🚀: `git push origin feature-name`.  
5️⃣ Submit a pull request 🔁.  

---

## 📝 License  

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more information.  

---

## 📧 Contact  

Feel free to reach out with questions, suggestions, or feedback! 💌  

- **Your Name**: your-email@example.com  
- **GitHub**: [your-username](https://github.com/your-username)  

Enjoy discovering awesome facts with the Numbers API app! 🎉📱✨
