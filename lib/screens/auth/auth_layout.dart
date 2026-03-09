import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  final String topImageUrl;
  final bool isLogin;
  final VoidCallback onToggle;

  const AuthLayout({
    super.key,
    required this.child,
    required this.topImageUrl,
    required this.isLogin,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFDE8E1), Color(0xFFFAD1C4)], // Soft pastel foodie gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Illustration Area
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.network(
                    topImageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (ctx, err, st) => const Icon(Icons.fastfood, size: 80, color: Colors.orangeAccent),
                  ),
                ),
              ),

              // Bottom White Card
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Toggle Switch
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              _buildTabItem('Register', !isLogin),
                              _buildTabItem('Log In', isLogin),
                            ],
                          ),
                        ),
                      ),

                      // Rest of the form content (scrollable if needed)
                      Expanded(
                        child: child,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            onToggle();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFF5C40) : Colors.transparent, // Bright reddish orange
            borderRadius: BorderRadius.circular(30),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFFFF5C40).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
