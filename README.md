# 🏦 SHEconomy - AI for Women's Financial Inclusion

<div align="center">
  <h3>Empowering Women's Financial Journey</h3>
  <p>A mobile-first Flutter app designed to help women learn, manage, and grow their finances</p>
  
  ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
  ![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)
  ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
</div>

## 🌟 Vision & Purpose

SHEconomy is designed to be:
- **Educational** → Teach financial literacy
- **Practical** → Wallet, budgeting, savings tools  
- **Empowering** → Insights, recommendations, and financial growth tracking

Perfect for empowering women's financial independence through technology.

## 🚀 Core Features (MVP)

### 📚 Learn Hub
- Financial literacy tutorials (articles, videos, interactive quizzes)
- Categories: Budgeting, Savings, Investments, Banking, Digital Payments
- Example topics: "How to Save ₹500/month", "What is UPI", "Basics of SIPs"

### 💼 Smart Dashboard  
- Wallet → income/expense tracking
- Insights → Charts for monthly spending, savings goals
- Reminders → Notifications for bill payments or savings milestones

### 📊 Financial Tools
- **Savings Calculator** → Suggests 20% savings rule
- **Budget Planner** → 50-30-20 expense categorization
- **Investment Suggestions** → FD, SIP, Gold savings recommendations

## 🛠️ Tech Stack

- **Frontend**: Flutter (cross-platform, fast UI)
- **Backend**: Firebase (Auth, Firestore DB, Cloud Functions)
- **Analytics**: Firebase Analytics
- **State Management**: Riverpod
- **UI Library**: Material Design 3 + Custom components
- **Charts**: FL Chart for data visualization

## 🏗️ Architecture
lib/
├── core/ # Core functionality & utilities
├── features/ # Feature-based modules
│ ├── authentication/ # Login, register, auth logic
│ ├── dashboard/ # Main dashboard & overview
│ ├── wallet/ # Transaction management
│ ├── learn_hub/ # Educational content
│ ├── insights/ # Analytics & reports
│ └── financial_tools/ # Calculators & planners
├── shared/ # Shared components & widgets
├── services/ # External services (Firebase, etc.)
└── config/ # App configuration & routing

## 📱 Database Structure (Firebase Firestore)

// Users Collection
users: {
uid123: {
name: "User Name",
email: "user@example.com",
totalBalance: 15000,
savingsGoal: 5000,
createdAt: timestamp
}
}

// Transactions Collection
transactions: {
t1: {
userId: "uid123",
type: "expense", // or "income"
category: "Food",
amount: 500,
date: "2025-10-01"
}
}

// Tutorials Collection
tutorials: {
tut1: {
title: "Basics of Budgeting",
type: "article", // or "video"
content: "Budgeting helps you control money...",
category: "budgeting"
}
}

text

## 🚦 Getting Started

### Prerequisites
- Flutter SDK (>=3.13.0)
- Firebase CLI  
- Dart SDK
- Git

### Installation

1. **Clone the repository**
git clone https://github.com/YOUR_USERNAME/sheconomy-app.git
cd sheconomy-app

text

2. **Install dependencies**
flutter pub get

text

3. **Configure Firebase**
flutterfire configure

text

4. **Run the app**
flutter run

text

## 🧪 Development Roadmap

- [x] Project setup and architecture
- [x] Firebase integration
- [x] Authentication system
- [ ] User registration and profile
- [ ] Dashboard implementation  
- [ ] Wallet and transaction management
- [ ] Learn Hub with tutorials
- [ ] Financial calculators
- [ ] Charts and insights
- [ ] Testing and deployment

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services  
- Women in fintech community for inspiration

---

<div align="center">
<p>Made with ❤️ for women's financial empowerment</p>
</div>
