import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../student/student_home.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import '../../services/app_state.dart';
import 'auth_layout.dart';

class LoginScreen extends StatefulWidget {
  final AppState appState;

  const LoginScreen({super.key, required this.appState});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _navigateTo(Widget page) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      isLogin: true,
      onToggle: () => _navigateTo(SignUpScreen(appState: widget.appState)),
      // Abstract foodie illustration mimicking the right side of the reference UI
      topImageUrl: 'https://cdn3d.iconscout.com/3d/premium/thumb/food-plate-with-fork-and-spoon-5221081-4375990.png',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            InputField(
              label: 'Email',
              hintText: 'alex.david@gmail.com',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              focusNode: _emailFocus,
            ),
            const SizedBox(height: 16),
            InputField(
              label: 'Password',
              hintText: '••••••',
              isPassword: true,
              controller: _passwordController,
              focusNode: _passwordFocus,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _rememberMe,
                        onChanged: (v) => setState(() => _rememberMe = v!),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        activeColor: const Color(0xFFFF5C40),
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('Remember Me', style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500)),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFFFF5C40), fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Log In',
              onPressed: () => _navigateTo(StudentHomeScreen(appState: widget.appState)),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey.shade300)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Or', style: TextStyle(color: Colors.black54, fontSize: 13)),
                ),
                Expanded(child: Divider(color: Colors.grey.shade300)),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Continue With Apple',
              isSecondary: true,
              icon: const Icon(Icons.apple, color: Colors.black87),
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Continue With Google',
              isSecondary: true,
              icon: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png',
                width: 20,
                height: 20,
                errorBuilder: (ctx, err, st) => const Icon(Icons.g_mobiledata, color: Colors.blue),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
