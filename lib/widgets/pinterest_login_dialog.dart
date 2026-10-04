import 'package:flutter/material.dart';

class PinterestLoginDialog extends StatefulWidget {
  const PinterestLoginDialog({Super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (context) => const PinterestLoginDialog(),
    );
  }

  @override
  State<PinterestLoginDialog> createState() => _PinterestLoginDialogState();
}

class _PinterestLoginDialogState extends State<PinterestLoginDialog> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildLeftColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Pinterest Logo
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFFE60023),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'P',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'serif',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Welcome title
          const Text(
            'Welcome to Pinterest',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111111),
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          const Text(
            'Log in to discover more ideas just for you',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF333333),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Email Input
          TextField(
            controller: _emailController,
            style: const TextStyle(fontSize: 14, color: Color(0xFF111111)),
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: const TextStyle(color: Color(0xFF767676), fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFF0084FF), width: 2),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Password Input
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            style: const TextStyle(fontSize: 14, color: Color(0xFF111111)),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: const TextStyle(color: Color(0xFF767676), fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xFF0084FF), width: 2),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: const Color(0xFF111111),
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Forgot password link
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {},
              child: const Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0084FF),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Log in button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE2E2E2),
                foregroundColor: const Color(0xFF767676),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: const Text(
                'Log in',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // OR divider
          const Text(
            'OR',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF111111)),
          ),
          const SizedBox(height: 12),

          // Continue with Google button
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF111111),
                side: const BorderSide(color: Color(0xFFCDCDCD)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'G',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFEA4335)),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Continue with Google',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // New to Pinterest? Join for free
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New to Pinterest? ',
                style: TextStyle(fontSize: 12, color: Color(0xFF111111)),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Join for free',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF111111)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Footer legal links
          const Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'Terms of Service • Privacy Policy • Notice at Collection',
                style: TextStyle(fontSize: 10, color: Color(0xFF767676)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRightColumn(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      padding: const EdgeInsets.all(32),
      child: Stack(
        children: [
          // Close ('X') button in top right
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close, size: 24, color: Color(0xFF111111)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Mock QR Code Box
                Container(
                  width: 180,
                  height: 180,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Simulated QR Pattern Grid
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 49,
                        itemBuilder: (context, index) {
                          final isCorner = index == 0 || index == 6 || index == 42 || index == 48;
                          final isDark = (index * 7 + 3) % 2 == 0 || isCorner;
                          return Container(
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF111111) : Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        },
                      ),
                      // Center Pinterest Logo Badge
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFE60023),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              'P',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'serif',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Text: log in instantly by scanning
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 15, color: Color(0xFF111111), height: 1.3),
                    children: [
                      TextSpan(text: 'Or, '),
                      TextSpan(
                        text: 'log in instantly',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' by scanning\ncode with your phone'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 720;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: isMobile ? 380 : 740,
        child: SingleChildScrollView(
          child: isMobile
              ? Column(
                  children: [
                    _buildRightColumn(context),
                    _buildLeftColumn(context),
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: _buildLeftColumn(context)),
                      Expanded(child: _buildRightColumn(context)),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
