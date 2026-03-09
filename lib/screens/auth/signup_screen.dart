import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'login_screen.dart';
import '../student/student_home.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import '../../services/app_state.dart';
import 'auth_layout.dart';

class SignUpScreen extends StatefulWidget {
  final AppState appState;

  const SignUpScreen({super.key, required this.appState});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocus.dispose();
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
      isLogin: false,
      onToggle: () => _navigateTo(LoginScreen(appState: widget.appState)),
      // 3D chef holding food illustration mimicking the left side of the reference UI
      topImageUrl: 'https://cdn3d.iconscout.com/3d/premium/thumb/chef-holding-plate-4886638-4074217.png',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            InputField(
              label: 'Full Name',
              hintText: 'Full Name',
              controller: _nameController,
              focusNode: _nameFocus,
            ),
            const SizedBox(height: 16),
            InputField(
              label: 'Email Address',
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              focusNode: _emailFocus,
            ),
            const SizedBox(height: 16),
            InputField(
              label: 'Password',
              hintText: 'Password',
              isPassword: true,
              controller: _passwordController,
              focusNode: _passwordFocus,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: _agreeToTerms,
                    onChanged: (v) => setState(() => _agreeToTerms = v!),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    activeColor: const Color(0xFFFF5C40),
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I agree to ',
                      style: const TextStyle(color: Colors.black87, fontSize: 12),
                      children: [
                        TextSpan(
                          text: 'Terms',
                          style: const TextStyle(color: Color(0xFFFF5C40), fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: const TextStyle(color: Color(0xFFFF5C40), fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Registration',
              onPressed: () {
                if (_agreeToTerms) {
                  _navigateTo(StudentHomeScreen(appState: widget.appState));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please agree to terms.'), backgroundColor: Color(0xFFFF5C40)),
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't Have An Account? ", style: TextStyle(color: Colors.black54, fontSize: 13)),
                GestureDetector(
                  onTap: () => _navigateTo(LoginScreen(appState: widget.appState)),
                  child: const Text(
                    'Sign Up', // Keeping "Sign Up" mapping from image, meaning go to register
                    style: TextStyle(color: Color(0xFFFF5C40), fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
