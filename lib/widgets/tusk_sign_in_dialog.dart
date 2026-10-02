import 'package:flutter/material.dart';

class TuskSignInDialog extends StatelessWidget {
  const TuskSignInDialog({Super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (context) => const TuskSignInDialog(),
    );
  }

  Widget _buildSocialButton({
    required Widget icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 82,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      elevation: 16,
      child: Container(
        width: 420,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with Close ('X') button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),

            // Tusk Logo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.all_inclusive,
                  color: Color(0xFFE11D48),
                  size: 28,
                ),
                const SizedBox(width: 6),
                const Text(
                  'tusk',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Title
            const Text(
              'Sign in to new.tusksearch.com',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),

            // Subtitle
            const Text(
              'Welcome back! Please sign in to continue',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Social Login Row (Apple, Facebook, Google)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  icon: const Icon(Icons.apple, color: Colors.black, size: 22),
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                _buildSocialButton(
                  icon: const Icon(Icons.facebook, color: Color(0xFF1877F2), size: 22),
                  onTap: () {},
                ),
                const SizedBox(width: 12),
                _buildSocialButton(
                  icon: const Text(
                    'G',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEA4335),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Divider line
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            const SizedBox(height: 16),

            // Sign Up link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Footer Secured by Clerk
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Secured by ',
                  style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6366F1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'clerk',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
