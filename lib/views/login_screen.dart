import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtl = TextEditingController();
  final _passCtl = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailCtl.dispose();
    _passCtl.dispose();
    super.dispose();
  }

  void _signIn() {
    // Demo only: navigate into the store without a backend.
    setState(() => _loading = true);
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() => _loading = false);
        Navigator.of(context).pushReplacementNamed('/main');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                // Logo
                Container(
                  width: 84,
                  height: 84,
                  decoration: AppTheme.primaryGradientDecoration,
                  child: const Center(
                    child: Icon(Icons.shopping_bag_outlined,
                        color: Colors.white, size: 42),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nexus Store ⚡',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'تسجيل الدخول إلى حسابك',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 40),
                // Email
                _field(
                  controller: _emailCtl,
                  hint: 'البريد الإلكتروني',
                  icon: Icons.email_outlined,
                  keyboard: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                // Password
                _field(
                  controller: _passCtl,
                  hint: 'كلمة المرور',
                  icon: Icons.lock_outline,
                  obscure: _obscure,
                  suffix: IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xFF94A3B8),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                // Sign in button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: _loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
                // Divider
                const Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.darkCardBorder)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'أو سجّل الدخول باستخدام',
                        style: TextStyle(
                            color: Color(0xFF94A3B8), fontSize: 12),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.darkCardBorder)),
                  ],
                ),
                const SizedBox(height: 20),
                // Social
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _social('assets/icons/google.png'),
                    const SizedBox(width: 16),
                    _social('assets/icons/facebook.png'),
                    const SizedBox(width: 16),
                    _social('assets/icons/x.png'),
                  ],
                ),
                const SizedBox(height: 32),
                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushReplacementNamed('/signup'),
                      child: const Text(
                        'أنشئ حساباً',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
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

  Widget _field({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboard = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkCard,
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF64748B)),
        prefixIcon: Icon(icon, color: const Color(0xFF94A3B8)),
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _social(String asset) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.darkCardBorder),
      ),
      child: Center(
        child: Image.asset(
          asset,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
