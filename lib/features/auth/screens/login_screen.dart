import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Mesh Background Implementation
        decoration: const BoxDecoration(
          color: Color(0xFFFDFAF5), // bg-cream
          gradient: RadialGradient(
            center: Alignment.topRight,
            radius: 1.5,
            colors: [
              Color(0x0DD4A017), // rgba(212, 160, 23, 0.05) - Gold
              Color(0x00D4A017),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Second radial gradient for bottom left
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomLeft,
                  radius: 1.5,
                  colors: [
                    Color(0x0D1A3C6E), // rgba(26, 60, 110, 0.05) - Navy
                    Color(0x001A3C6E),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Branding Header
                      Column(
                        children: [
                          const Icon(
                            Icons.church,
                            size: 64,
                            color: Color(0xFF002653), // primary
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'WorshippersMeet',
                            style: GoogleFonts.fraunces(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF002653), // primary
                              letterSpacing: -0.02,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Asymmetric Card
                      Container(
                        padding: const EdgeInsets.all(32.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(24),
                            bottomLeft: Radius.circular(8),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1A3C6E).withValues(alpha: 0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Welcome Back',
                              style: GoogleFonts.fraunces(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1C1C19), // on-background
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Sign in to your account',
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                color: const Color(0xFF718096), // text-muted
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 24),
                            
                            // Email Field
                            TextFormField(
                              style: GoogleFonts.nunito(fontSize: 16),
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: GoogleFonts.nunito(
                                  color: const Color(0xFF747780), // outline
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xFFC4C6D0)), // outline-variant
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xFF002653), width: 2), // primary
                                ),
                                prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF747780)),
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            // Password Field
                            TextFormField(
                              obscureText: true,
                              style: GoogleFonts.nunito(fontSize: 16),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: GoogleFonts.nunito(
                                  color: const Color(0xFF747780),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xFFC4C6D0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xFF002653), width: 2),
                                ),
                                prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF747780)),
                              ),
                            ),
                            const SizedBox(height: 8),
                            
                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: GoogleFonts.nunito(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF002653),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            
                            // Sign In Button
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF002653), // primary
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Sign Up Link (Gold Underline effect)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: const Color(0xFF1C1C19),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD4A017), // gold underline
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Sign up',
                                style: GoogleFonts.nunito(
                                  fontSize: 15,
                                  color: const Color(0xFF002653),
                                  fontWeight: FontWeight.w800,
                                ),
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
          ],
        ),
      ),
    );
  }
}
