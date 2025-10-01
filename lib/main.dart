import 'package:flutter/material.dart';

void main() {
  runApp(const SHEconomyApp());
}

class SHEconomyApp extends StatelessWidget {
  const SHEconomyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHEconomy',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/wallet': (context) => const WalletPage(),
        '/learn': (context) => const LearnHubPage(),
        '/insights': (context) => const InsightsPage(),
        '/tools': (context) => const ToolsPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

// ===============================================
// SPLASH SCREEN
// ===============================================
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B73FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.savings,
                size: 64,
                color: Color(0xFF6B73FF),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'SHEconomy',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Empowering Women\'s Financial Journey',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================================
// LOGIN PAGE
// ===============================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48),

                // Logo and title
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B73FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.savings,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3142),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Sign in to continue your financial journey',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Email field
                _buildTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  hint: 'Enter your email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Password field
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Login button
                _buildButton(
                  text: 'Sign In',
                  onPressed: _login,
                  isLoading: _isLoading,
                ),

                const SizedBox(height: 16),

                // Forgot password
                TextButton(
                  onPressed: () {
                    _showSnackbar('Forgot password feature coming soon!');
                  },
                  child: const Text('Forgot Password?'),
                ),

                const SizedBox(height: 24),

                // Divider
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 24),

                // Register link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account? '),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B73FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D3142),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword ? _obscurePassword : false,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6B73FF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

// ===============================================
// REGISTER PAGE
// ===============================================
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_agreeToTerms) {
      _showSnackbar('Please agree to terms and conditions');
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (mounted) {
      _showSnackbar('Account created successfully! Please login.');
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FE),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2D3142)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start your financial empowerment journey',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8B8B8B),
                  ),
                ),

                const SizedBox(height: 32),

                // Name field
                _buildTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  icon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value.length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Email field
                _buildTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  hint: 'Enter your email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Password field
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Create a strong password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  obscureText: _obscurePassword,
                  onTogglePassword: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Confirm Password field
                _buildTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  hint: 'Re-enter your password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  obscureText: _obscureConfirmPassword,
                  onTogglePassword: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // Terms and conditions checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _agreeToTerms,
                      onChanged: (value) =>
                          setState(() => _agreeToTerms = value ?? false),
                      activeColor: const Color(0xFF6B73FF),
                    ),
                    const Expanded(
                      child: Text(
                        'I agree to the Terms & Conditions and Privacy Policy',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Register button
                _buildButton(
                  text: 'Create Account',
                  onPressed: _register,
                  isLoading: _isLoading,
                ),

                const SizedBox(height: 24),

                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B73FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onTogglePassword,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D3142),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: onTogglePassword,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6B73FF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

// ===============================================
// TRANSACTION MODEL
// ===============================================
enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final IconData icon;

  Transaction({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.type,
    required this.icon,
  });
}

// ===============================================
// DASHBOARD PAGE WITH SHARED DATA
// ===============================================
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // SHARED TRANSACTION DATA FOR ALL TABS
  List<Transaction> sharedTransactions = [
    Transaction(
      id: '1',
      title: 'Salary Credit',
      category: 'Salary',
      amount: 45000,
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: TransactionType.income,
      icon: Icons.work,
    ),
    Transaction(
      id: '2',
      title: 'Grocery Shopping',
      category: 'Food & Dining',
      amount: 2450,
      date: DateTime.now().subtract(const Duration(days: 2)),
      type: TransactionType.expense,
      icon: Icons.shopping_bag,
    ),
    Transaction(
      id: '3',
      title: 'Freelance Work',
      category: 'Freelance',
      amount: 8500,
      date: DateTime.now().subtract(const Duration(days: 3)),
      type: TransactionType.income,
      icon: Icons.laptop,
    ),
    Transaction(
      id: '4',
      title: 'Electricity Bill',
      category: 'Bills & Utilities',
      amount: 1200,
      date: DateTime.now().subtract(const Duration(days: 4)),
      type: TransactionType.expense,
      icon: Icons.flash_on,
    ),
    Transaction(
      id: '5',
      title: 'Netflix Subscription',
      category: 'Entertainment',
      amount: 649,
      date: DateTime.now().subtract(const Duration(days: 5)),
      type: TransactionType.expense,
      icon: Icons.tv,
    ),
    Transaction(
      id: '6',
      title: 'Coffee Shop',
      category: 'Food & Dining',
      amount: 150,
      date: DateTime.now().subtract(const Duration(days: 6)),
      type: TransactionType.expense,
      icon: Icons.local_cafe,
    ),
    Transaction(
      id: '7',
      title: 'Investment Return',
      category: 'Investment',
      amount: 3200,
      date: DateTime.now().subtract(const Duration(days: 7)),
      type: TransactionType.income,
      icon: Icons.trending_up,
    ),
  ];

  // Calculate totals from shared data
  double get totalBalance {
    double income = sharedTransactions
        .where((t) => t.type == TransactionType.income)
        .fold(0, (sum, t) => sum + t.amount);
    double expenses = sharedTransactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0, (sum, t) => sum + t.amount);
    return income - expenses;
  }

  double get totalIncome {
    return sharedTransactions
        .where((t) => t.type == TransactionType.income)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double get totalExpenses {
    return sharedTransactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0, (sum, t) => sum + t.amount);
  }

  // Methods to update shared data
  void addTransaction(Transaction transaction) {
    setState(() {
      sharedTransactions.insert(0, transaction);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      sharedTransactions.removeWhere((t) => t.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FE),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'SHEconomy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              _showSnackbar('Notifications coming soon!');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: _getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6B73FF),
        unselectedItemColor: const Color(0xFF8B8B8B),
        backgroundColor: Colors.white,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            activeIcon: Icon(Icons.insights),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            activeIcon: Icon(Icons.calculate),
            label: 'Tools',
          ),
        ],
      ),
    );
  }

  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 0:
        return DashboardHome(
          totalBalance: totalBalance,
          totalIncome: totalIncome,
          totalExpenses: totalExpenses,
          recentTransactions: sharedTransactions.take(3).toList(),
        );
      case 1:
        return WalletTab(
          transactions: sharedTransactions,
          onAddTransaction: addTransaction,
          onDeleteTransaction: deleteTransaction,
        );
      case 2:
        return const LearnTab();
      case 3:
        return InsightsTab(transactions: sharedTransactions);
      case 4:
        return const ToolsTab();
      default:
        return DashboardHome(
          totalBalance: totalBalance,
          totalIncome: totalIncome,
          totalExpenses: totalExpenses,
          recentTransactions: sharedTransactions.take(3).toList(),
        );
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

// ===============================================
// DASHBOARD HOME WITH SHARED DATA
// ===============================================
class DashboardHome extends StatelessWidget {
  final double totalBalance;
  final double totalIncome;
  final double totalExpenses;
  final List<Transaction> recentTransactions;

  const DashboardHome({
    super.key,
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpenses,
    required this.recentTransactions,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          const Text(
            'Good Evening! 👋',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Let\'s check your financial progress',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF8B8B8B),
            ),
          ),

          const SizedBox(height: 24),

          // Balance Card - NOW UPDATES WITH REAL DATA
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6B73FF), Color(0xFF9C27B0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6B73FF).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '₹${totalBalance.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Income',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            '₹${totalIncome.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Expenses',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            '₹${totalExpenses.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Quick Actions
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.add,
                  title: 'Add Income',
                  color: const Color(0xFF4CAF50),
                  onTap: () => Navigator.pushNamed(context, '/wallet'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.remove,
                  title: 'Add Expense',
                  color: const Color(0xFFE57373),
                  onTap: () => Navigator.pushNamed(context, '/wallet'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.insights,
                  title: 'View Report',
                  color: const Color(0xFFFF9800),
                  onTap: () => Navigator.pushNamed(context, '/insights'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Recent Transactions - NOW SHOWS REAL DATA
          const Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 16),

          // Show actual recent transactions
          ...recentTransactions
              .map((transaction) => _TransactionCard(
                    transaction: transaction,
                    onDelete: () {}, // Disable delete on dashboard
                  ))
              .toList(),

          const SizedBox(height: 24),

          // Logout button for testing
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D3142),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================================
// WALLET TAB WITH SHARED DATA
// ===============================================
class WalletTab extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(Transaction) onAddTransaction;
  final Function(String) onDeleteTransaction;

  const WalletTab({
    super.key,
    required this.transactions,
    required this.onAddTransaction,
    required this.onDeleteTransaction,
  });

  double get totalBalance {
    double income = transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0, (sum, t) => sum + t.amount);
    double expenses = transactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0, (sum, t) => sum + t.amount);
    return income - expenses;
  }

  double get totalIncome {
    return transactions
        .where((t) => t.type == TransactionType.income)
        .fold(0, (sum, t) => sum + t.amount);
  }

  double get totalExpenses {
    return transactions
        .where((t) => t.type == TransactionType.expense)
        .fold(0, (sum, t) => sum + t.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Balance Summary Card - UPDATES IN REAL TIME
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6B73FF), Color(0xFF9C27B0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6B73FF).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '₹${totalBalance.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBalanceItem(
                      'Income', totalIncome, Icons.trending_up, true),
                  Container(width: 1, height: 40, color: Colors.white30),
                  _buildBalanceItem(
                      'Expenses', totalExpenses, Icons.trending_down, false),
                ],
              ),
            ],
          ),
        ),

        // Add Transaction Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showAddTransactionDialog(
                      context, TransactionType.income),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Income'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _showAddTransactionDialog(
                      context, TransactionType.expense),
                  icon: const Icon(Icons.remove),
                  label: const Text('Add Expense'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE57373),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Transactions Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
              ),
              TextButton(
                onPressed: () {
                  _showAllTransactions(context);
                },
                child: const Text('View All'),
              ),
            ],
          ),
        ),

        // Transactions List - UPDATES IN REAL TIME
        Expanded(
          child: transactions.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 80,
                        color: Color(0xFF8B8B8B),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No transactions yet',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                      Text(
                        'Add your first income or expense',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return _TransactionCard(
                      transaction: transaction,
                      onDelete: () {
                        onDeleteTransaction(transaction.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Transaction deleted'),
                            backgroundColor: Color(0xFFE57373),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildBalanceItem(
      String title, double amount, IconData icon, bool isIncome) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
        Text(
          '₹${amount.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _showAddTransactionDialog(BuildContext context, TransactionType type) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTransactionSheet(
        type: type,
        onAdd: onAddTransaction,
      ),
    );
  }

  void _showAllTransactions(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllTransactionsPage(
          transactions: transactions,
          onDelete: onDeleteTransaction,
        ),
      ),
    );
  }
}

// ===============================================
// TRANSACTION CARD WIDGET
// ===============================================
class _TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onDelete;

  const _TransactionCard({
    required this.transaction,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Dismissible(
        key: Key(transaction.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFE57373),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) => onDelete(),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isIncome
                  ? const Color(0xFF4CAF50).withOpacity(0.1)
                  : const Color(0xFFE57373).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              transaction.icon,
              color:
                  isIncome ? const Color(0xFF4CAF50) : const Color(0xFFE57373),
              size: 24,
            ),
          ),
          title: Text(
            transaction.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3142),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.category,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8B8B8B),
                ),
              ),
              Text(
                _formatDate(transaction.date),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8B8B8B),
                ),
              ),
            ],
          ),
          trailing: Text(
            '${isIncome ? '+' : '-'}₹${transaction.amount.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:
                  isIncome ? const Color(0xFF4CAF50) : const Color(0xFFE57373),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

// ===============================================
// ADD TRANSACTION SHEET
// ===============================================
class AddTransactionSheet extends StatefulWidget {
  final TransactionType type;
  final Function(Transaction) onAdd;

  const AddTransactionSheet({
    super.key,
    required this.type,
    required this.onAdd,
  });

  @override
  State<AddTransactionSheet> createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String? _selectedCategory;
  IconData? _selectedIcon;

  final Map<String, IconData> incomeCategories = {
    'Salary': Icons.work,
    'Freelance': Icons.laptop,
    'Business': Icons.business,
    'Investment': Icons.trending_up,
    'Gift': Icons.card_giftcard,
    'Others': Icons.more_horiz,
  };

  final Map<String, IconData> expenseCategories = {
    'Food & Dining': Icons.restaurant,
    'Transportation': Icons.directions_car,
    'Shopping': Icons.shopping_bag,
    'Entertainment': Icons.movie,
    'Bills & Utilities': Icons.flash_on,
    'Healthcare': Icons.local_hospital,
    'Education': Icons.school,
    'Others': Icons.more_horiz,
  };

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isIncome = widget.type == TransactionType.income;
    final categories = isIncome ? incomeCategories : expenseCategories;

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isIncome
                        ? const Color(0xFF4CAF50)
                        : const Color(0xFFE57373),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Add ${isIncome ? 'Income' : 'Expense'}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Title Field
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter transaction title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Amount Field
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: 'Enter amount',
                prefixText: '₹ ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Category Selection
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D3142),
              ),
            ),
            const SizedBox(height: 8),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: categories.keys.map((category) {
                final isSelected = _selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                      _selectedIcon = categories[category];
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (isIncome
                              ? const Color(0xFF4CAF50)
                              : const Color(0xFFE57373))
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          categories[category],
                          size: 16,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF8B8B8B),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF2D3142),
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Add Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _addTransaction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isIncome
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFE57373),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add ${isIncome ? 'Income' : 'Expense'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _addTransaction() {
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Color(0xFFE57373),
        ),
      );
      return;
    }

    final transaction = Transaction(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      category: _selectedCategory!,
      amount: double.parse(_amountController.text),
      date: DateTime.now(),
      type: widget.type,
      icon: _selectedIcon!,
    );

    widget.onAdd(transaction);
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${widget.type == TransactionType.income ? 'Income' : 'Expense'} added successfully!',
        ),
        backgroundColor: widget.type == TransactionType.income
            ? const Color(0xFF4CAF50)
            : const Color(0xFFE57373),
      ),
    );
  }
}

// ===============================================
// ALL TRANSACTIONS PAGE
// ===============================================
class AllTransactionsPage extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onDelete;

  const AllTransactionsPage({
    super.key,
    required this.transactions,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        title: const Text('All Transactions'),
        backgroundColor: const Color(0xFFF8F9FE),
        elevation: 0,
      ),
      body: transactions.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long,
                    size: 80,
                    color: Color(0xFF8B8B8B),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No transactions found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF8B8B8B),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return _TransactionCard(
                  transaction: transaction,
                  onDelete: () {
                    onDelete(transaction.id);
                    Navigator.pop(context);
                  },
                );
              },
            ),
    );
  }
}

// ===============================================
// INSIGHTS TAB WITH SHARED DATA
// ===============================================
class InsightsTab extends StatefulWidget {
  final List<Transaction> transactions;

  const InsightsTab({super.key, required this.transactions});

  @override
  State<InsightsTab> createState() => _InsightsTabState();
}

class _InsightsTabState extends State<InsightsTab> {
  String selectedPeriod = 'This Month';

  Map<String, double> get expensesByCategory {
    Map<String, double> categoryTotals = {};

    final expenses =
        widget.transactions.where((t) => t.type == TransactionType.expense);

    for (var transaction in expenses) {
      categoryTotals[transaction.category] =
          (categoryTotals[transaction.category] ?? 0) + transaction.amount;
    }

    return categoryTotals;
  }

  double get totalExpenses => widget.transactions
      .where((t) => t.type == TransactionType.expense)
      .fold(0, (sum, t) => sum + t.amount);

  double get totalIncome => widget.transactions
      .where((t) => t.type == TransactionType.income)
      .fold(0, (sum, t) => sum + t.amount);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with period selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Financial Insights',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6B73FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  value: selectedPeriod,
                  underline: Container(),
                  icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B73FF),
                  ),
                  items: ['This Week', 'This Month', 'This Year']
                      .map((period) => DropdownMenuItem(
                            value: period,
                            child: Text(period),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPeriod = value!;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Summary Cards Row - NOW UPDATES WITH REAL DATA
          Row(
            children: [
              Expanded(
                child: _SummaryCard(
                  title: 'Total Income',
                  amount: totalIncome,
                  color: const Color(0xFF4CAF50),
                  icon: Icons.trending_up,
                  percentage: '+12.5%',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SummaryCard(
                  title: 'Total Expenses',
                  amount: totalExpenses,
                  color: const Color(0xFFE57373),
                  icon: Icons.trending_down,
                  percentage: '+8.3%',
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Savings Card - NOW UPDATES WITH REAL DATA
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6B73FF), Color(0xFF9C27B0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6B73FF).withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Net Savings',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        totalIncome > totalExpenses ? 'Great!' : 'Review',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '₹${(totalIncome - totalExpenses).toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  totalIncome > 0
                      ? 'You saved ${(((totalIncome - totalExpenses) / totalIncome) * 100).toStringAsFixed(1)}% of your income this month'
                      : 'Add some income to see your savings rate',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Spending Breakdown Chart - NOW UPDATES WITH REAL DATA
          const Text(
            'Spending Breakdown',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Simple Pie Chart Representation
                if (expensesByCategory.isNotEmpty) ...[
                  SizedBox(
                    height: 200,
                    child: _buildSimplePieChart(),
                  ),
                  const SizedBox(height: 20),
                  // Category List - NOW SHOWS REAL CATEGORIES
                  ...expensesByCategory.entries.map((entry) {
                    final percentage = (entry.value / totalExpenses * 100);
                    return _CategoryItem(
                      category: entry.key,
                      amount: entry.value,
                      percentage: percentage,
                      color: _getCategoryColor(entry.key),
                    );
                  }).toList(),
                ] else ...[
                  const SizedBox(height: 100),
                  const Center(
                    child: Column(
                      children: [
                        Icon(Icons.pie_chart_outline,
                            size: 60, color: Color(0xFF8B8B8B)),
                        SizedBox(height: 16),
                        Text(
                          'No expenses yet',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF8B8B8B)),
                        ),
                        Text(
                          'Add some expenses to see the breakdown',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF8B8B8B)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Weekly Spending Trend
          const Text(
            'Weekly Spending Trend',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: _buildWeeklyChart(),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Mon',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF8B8B8B))),
                    Text('Tue',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF8B8B8B))),
                    Text('Wed',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF8B8B8B))),
                    Text('Thu',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF8B8B8B))),
                    Text('Fri',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF8B8B8B))),
                    Text('Sat',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF8B8B8B))),
                    Text('Sun',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF8B8B8B))),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Financial Health Score - NOW CALCULATES REAL SCORE
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Financial Health Score',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: _calculateHealthScore(),
                            strokeWidth: 8,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              _getHealthScoreColor(),
                            ),
                          ),
                        ),
                        Text(
                          '${(_calculateHealthScore() * 100).toInt()}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _getHealthScoreColor(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getHealthScoreMessage(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3142),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _getHealthScoreDescription(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF8B8B8B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Recommendations
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(16),
              border:
                  Border.all(color: const Color(0xFFFFB74D).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB74D).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.lightbulb_outline,
                        color: Color(0xFFFF8F00),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Smart Recommendations',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...(_getRecommendations()
                    .map((rec) => _RecommendationItem(
                          icon: rec['icon'] as IconData,
                          text: rec['text'] as String,
                        ))
                    .toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimplePieChart() {
    return CustomPaint(
      size: const Size(200, 200),
      painter: PieChartPainter(expensesByCategory, totalExpenses),
    );
  }

  Widget _buildWeeklyChart() {
    // Sample weekly data based on transactions
    List<double> weeklyExpenses = [800, 1200, 600, 950, 1100, 1400, 700];
    double maxExpense = weeklyExpenses.isEmpty
        ? 1
        : weeklyExpenses.reduce((a, b) => a > b ? a : b);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: weeklyExpenses.map((expense) {
        double height = (expense / maxExpense) * 120;
        return Container(
          width: 25,
          height: height,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6B73FF), Color(0xFF9C27B0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }).toList(),
    );
  }

  Color _getCategoryColor(String category) {
    final colors = {
      'Food & Dining': const Color(0xFFE57373),
      'Transportation': const Color(0xFF64B5F6),
      'Shopping': const Color(0xFF81C784),
      'Entertainment': const Color(0xFFFFB74D),
      'Bills & Utilities': const Color(0xFF9575CD),
      'Healthcare': const Color(0xFF4DB6AC),
      'Education': const Color(0xFFA1887F),
      'Others': const Color(0xFF90A4AE),
    };
    return colors[category] ?? const Color(0xFF90A4AE);
  }

  // REAL FINANCIAL HEALTH CALCULATIONS
  double _calculateHealthScore() {
    if (totalIncome <= 0) return 0.0;

    double savingsRate = (totalIncome - totalExpenses) / totalIncome;
    if (savingsRate >= 0.20) return 1.0; // 100% if saving 20%+
    if (savingsRate >= 0.10) return 0.8; // 80% if saving 10-20%
    if (savingsRate >= 0.05) return 0.6; // 60% if saving 5-10%
    if (savingsRate >= 0.0) return 0.4; // 40% if breaking even
    return 0.2; // 20% if spending more than earning
  }

  Color _getHealthScoreColor() {
    double score = _calculateHealthScore();
    if (score >= 0.8) return const Color(0xFF4CAF50);
    if (score >= 0.6) return const Color(0xFFFFB74D);
    return const Color(0xFFE57373);
  }

  String _getHealthScoreMessage() {
    double score = _calculateHealthScore();
    if (score >= 0.8) return 'Excellent Financial Health!';
    if (score >= 0.6) return 'Good Financial Health';
    if (score >= 0.4) return 'Fair Financial Health';
    return 'Needs Improvement';
  }

  String _getHealthScoreDescription() {
    double score = _calculateHealthScore();
    if (score >= 0.8)
      return 'You\'re saving well and maintaining great financial habits!';
    if (score >= 0.6) return 'You\'re doing well but could save a bit more.';
    if (score >= 0.4) return 'Try to reduce expenses and increase savings.';
    return 'Focus on cutting expenses and building an emergency fund.';
  }

  List<Map<String, dynamic>> _getRecommendations() {
    List<Map<String, dynamic>> recommendations = [];

    if (totalIncome <= 0) {
      recommendations.add({
        'icon': Icons.work,
        'text': 'Add your income sources to get personalized recommendations',
      });
      return recommendations;
    }

    double savingsRate = (totalIncome - totalExpenses) / totalIncome;

    if (savingsRate < 0.20) {
      recommendations.add({
        'icon': Icons.savings,
        'text':
            'Try to save at least 20% of your income for better financial health',
      });
    }

    // Find highest expense category
    if (expensesByCategory.isNotEmpty) {
      var highestCategory = expensesByCategory.entries
          .reduce((a, b) => a.value > b.value ? a : b);
      recommendations.add({
        'icon': Icons.trending_down,
        'text':
            'Consider reducing ${highestCategory.key} expenses by ₹500 monthly',
      });
    }

    recommendations.add({
      'icon': Icons.trending_up,
      'text': 'Invest ₹2000 monthly in SIP for long-term wealth building',
    });

    return recommendations;
  }
}

// Summary Card Widget
class _SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color color;
  final IconData icon;
  final String percentage;

  const _SummaryCard({
    required this.title,
    required this.amount,
    required this.color,
    required this.icon,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  percentage,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8B8B8B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '₹${amount.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
        ],
      ),
    );
  }
}

// Category Item Widget
class _CategoryItem extends StatelessWidget {
  final String category;
  final double amount;
  final double percentage;
  final Color color;

  const _CategoryItem({
    required this.category,
    required this.amount,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              category,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D3142),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹${amount.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
              ),
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8B8B8B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Recommendation Item Widget
class _RecommendationItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _RecommendationItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: const Color(0xFFFF8F00),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF2D3142),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Pie Chart Painter
class PieChartPainter extends CustomPainter {
  final Map<String, double> data;
  final double total;

  PieChartPainter(this.data, this.total);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    double startAngle = 0;

    final colors = [
      const Color(0xFFE57373),
      const Color(0xFF64B5F6),
      const Color(0xFF81C784),
      const Color(0xFFFFB74D),
      const Color(0xFF9575CD),
      const Color(0xFF4DB6AC),
      const Color(0xFFA1887F),
      const Color(0xFF90A4AE),
    ];

    int colorIndex = 0;

    for (var entry in data.entries) {
      final sweepAngle = (entry.value / total) * 2 * 3.14159;

      final paint = Paint()
        ..color = colors[colorIndex % colors.length]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
      colorIndex++;
    }

    // Draw center circle for donut effect
    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius / 2, centerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ===============================================
// PLACEHOLDER TABS - LEARN & TOOLS
// ===============================================
class LearnTab extends StatelessWidget {
  const LearnTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 80, color: Color(0xFF6B73FF)),
          SizedBox(height: 16),
          Text(
            'Learn Hub',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Coming Soon!',
            style: TextStyle(fontSize: 18, color: Color(0xFF8B8B8B)),
          ),
        ],
      ),
    );
  }
}

class ToolsTab extends StatelessWidget {
  const ToolsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calculate, size: 80, color: Color(0xFF6B73FF)),
          SizedBox(height: 16),
          Text(
            'Financial Tools',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Coming Soon!',
            style: TextStyle(fontSize: 18, color: Color(0xFF8B8B8B)),
          ),
        ],
      ),
    );
  }
}

// ===============================================
// PLACEHOLDER PAGES FOR ROUTES
// ===============================================
class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor: const Color(0xFFF8F9FE),
      ),
      backgroundColor: const Color(0xFFF8F9FE),
      body: const Center(
        child: Text('Wallet page - use bottom navigation instead'),
      ),
    );
  }
}

class LearnHubPage extends StatelessWidget {
  const LearnHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Hub'),
        backgroundColor: const Color(0xFFF8F9FE),
      ),
      backgroundColor: const Color(0xFFF8F9FE),
      body: const LearnTab(),
    );
  }
}

class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
        backgroundColor: const Color(0xFFF8F9FE),
      ),
      backgroundColor: const Color(0xFFF8F9FE),
      body: const Center(
        child: Text('Insights page - use bottom navigation instead'),
      ),
    );
  }
}

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Tools'),
        backgroundColor: const Color(0xFFF8F9FE),
      ),
      backgroundColor: const Color(0xFFF8F9FE),
      body: const ToolsTab(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFF8F9FE),
      ),
      backgroundColor: const Color(0xFFF8F9FE),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: Color(0xFF6B73FF)),
            SizedBox(height: 16),
            Text(
              'Profile Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Coming Soon!',
              style: TextStyle(fontSize: 18, color: Color(0xFF8B8B8B)),
            ),
          ],
        ),
      ),
    );
  }
}
