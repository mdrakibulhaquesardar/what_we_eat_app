# 🍽️ What We Eat – Flutter + Laravel Based Halal Food Scanner App

![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue?logo=flutter)
![Laravel](https://img.shields.io/badge/Backend-Laravel-red?logo=laravel)
![License](https://img.shields.io/github/license/yourusername/what-we-eat)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)

> A smart mobile app that scans food barcodes and tells you whether your food is **Halal**, **Haram**, or **Doubtful** — along with nutrition, ingredients, and pricing info.  
> Powered by **Flutter (Frontend)** and **Laravel (Backend)**.

---

## 🧠 Core Idea

This app solves the problem of **Halal food identification** in modern markets. With confusing ingredients and hidden additives, it’s hard to know what you're eating.

**What We Eat** makes this easy:
1. **Scan the barcode**
2. **Detect the food product**
3. **Analyze ingredients**
4. **Classify as Halal / Haram**
5. **Show detailed nutrition + price info**
6. **Users can submit food not found in database**

---

## 📲 App Features

| Feature | Description |
|--------|-------------|
| 📷 **Barcode Scanner** | Scans packaged food barcodes using camera |
| 🔍 **Food Detection** | Uses OpenFoodFacts + Laravel DB for product info |
| ✅ **Halal/Haram Tag** | Parses ingredients, classifies status (✅❌⚠️) |
| 🧾 **Nutritional Info** | Calories, protein, fat, carbs, sugar, etc. |
| 🧠 **Ingredient Breakdown** | Shows all components and highlights haram/doubtful |
| 📤 **User Submission** | Add new food manually if missing |
| 🔐 **Admin Panel** | Admins can review, approve, and manage user submissions |
| 🌍 **Multi-language Support** | (Planned) English, Bangla, and Arabic |
| 📊 **User History & Analytics** | (Planned) See your scanned history and trends |

## 🧱 Folder Structure

```txt
📦 what-we-eat/
├── 📁 frontend/ (Flutter App)
│   ├── lib/
│   │   ├── models/
│   │   ├── views/
│   │   ├── services/
│   │   └── main.dart
│   └── pubspec.yaml
├── 📁 backend/ (Laravel API)
│   ├── app/
│   │   └── Http/Controllers/
│   ├── routes/api.php
│   └── database/migrations/
└── README.md
```

## 🌐 API Architecture

```text
User (Mobile App)
      ↓ (Barcode)
Flutter App → Laravel API → MySQL Database
                     ↑
           External APIs (OpenFoodFacts, etc.)
```

🔧 Tech Stack
Frontend (Flutter)
mobile_scanner: For barcode scanning

http: REST API requests

provider / getx: State management

flutter_localizations: Multi-language support

Backend (Laravel)
Laravel 11+

MySQL or PostgreSQL

Laravel Sanctum or JWT (for user auth)

REST API with validation, middleware, and resource controllers

| Type          | Tool                |
| ------------- | ------------------- |
| Code          | Flutter, Laravel    |
| API Debugging | Postman             |
| UI Design     | Figma               |
| Hosting       | Laravel Vapor / VPS |
| Version Ctrl  | Git + GitHub        |

🧪 Setup Instructions
🚀 Flutter Setup

```dart
git clone https://github.com/yourusername/what-we-eat.git
cd what-we-eat/frontend
flutter pub get
flutter run
```

🔧 Laravel API Setup
```bash
cd backend
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve
```
Make sure to update API base URL in Flutter’s config.

| Method | Route                   | Description                 |
| ------ | ----------------------- | --------------------------- |
| GET    | `/api/food/{barcode}`   | Get food info by barcode    |
| POST   | `/api/food/submit`      | User adds new food item     |
| GET    | `/api/halal/check/{id}` | Halal check via ingredients |
| GET    | `/api/user/history`     | User scan history           |

❓ FAQs
Q: What if a product isn't found?
A: The user can submit it manually via the "Add Food" feature.

Q: How is halal/haram decided?
A: Ingredients are compared against a backend-managed rule list (customizable).

Q: Can I trust the result?
A: 100% accurate detection isn't guaranteed. Always use personal discretion.

🤝 Author
Made with ❤️ by Rakibul
📧 Email: rakibulhaques@gmail.com

