import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_theme.dart';

enum TicketTier { standard, vip }
enum PaymentMethod { momo, telecel, card }

class CheckoutFlowScreen extends StatefulWidget {
  const CheckoutFlowScreen({super.key});

  @override
  State<CheckoutFlowScreen> createState() => _CheckoutFlowScreenState();
}

class _CheckoutFlowScreenState extends State<CheckoutFlowScreen>
    with SingleTickerProviderStateMixin {
  TicketTier _selectedTier = TicketTier.vip;
  PaymentMethod _selectedPayment = PaymentMethod.momo;
  final TextEditingController _phoneController =
      TextEditingController(text: '024 123 4567');
  bool _showError = false;
  bool _isPaying = false;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Color _pulseColor(double value) {
    // value goes 0..1, mimic the CSS keyframes (gold -> darker -> gold)
    const Color start = Color(0xFFd3a117);
    const Color mid = Color(0xFFb38813);
    return Color.lerp(start, mid, (value <= 0.5) ? value * 2 : (1 - value) * 2)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: Stack(
        children: [
          // Bottom sheet container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag handle
                  Container(
                    width: 48,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.muted.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Header with close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Select Tickets & Pay',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textNavy)),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => context.pop(),
                        color: AppColors.muted,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Step 1 – Tier selection
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('1. Select Tier',
                        style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textNavy,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  _tierCard(
                    title: 'Standard Admission',
                    subtitle: 'General seating area',
                    price: 'Free',
                    value: TicketTier.standard,
                  ),
                  const SizedBox(height: 8),
                  _tierCard(
                    title: 'VIP Seating',
                    subtitle: 'Premium front-row access',
                    price: '100 GHS',
                    value: TicketTier.vip,
                    selected: true,
                  ),
                  const SizedBox(height: 24),
                  // Step 2 – Payment method
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('2. Payment Method',
                        style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textNavy,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  _paymentOption(
                    label: 'MTN Mobile Money',
                    icon: Icons.phone_iphone,
                    value: PaymentMethod.momo,
                    selected: true,
                  ),
                  _paymentOption(
                    label: 'Telecel Cash',
                    icon: Icons.smartphone,
                    value: PaymentMethod.telecel,
                  ),
                  _paymentOption(
                    label: 'Bank Card',
                    icon: Icons.credit_card,
                    value: PaymentMethod.card,
                  ),
                  const SizedBox(height: 24),
                  // Step 3 – Phone number
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('3. Mobile Number',
                        style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textNavy,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixText: '+233 ',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: '024 XXX XXXX',
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Error banner (conditionally shown)
                  if (_showError)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        border: Border.all(color: AppColors.error),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.error, color: AppColors.error, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text('Payment failed. Please check your MoMo balance or try another method.',
                                style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 80), // space for sticky CTA
                ],
              ),
            ),
          ),
          // Sticky CTA button (fixed at bottom over the sheet)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) {
                      final color = _pulseColor(_pulseController.value);
                      return SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isPaying ? color : AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: _isPaying
                              ? null
                              : () {
                                  setState(() => _isPaying = true);
                                  // Placeholder – simulate a short delay then reset
                                  Future.delayed(const Duration(seconds: 2), () {
                                    setState(() {
                                      _isPaying = false;
                                      _showError = true; // show error for demo
                                    });
                                  });
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Pay 100 GHS', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 8),
                              Icon(Icons.lock),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.verified_user, size: 14, color: AppColors.muted),
                      SizedBox(width: 4),
                      Text('Secure payment processed locally',
                          style: TextStyle(fontSize: 12, color: AppColors.muted)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tierCard({
    required String title,
    required String subtitle,
    required String price,
    required TicketTier value,
    bool selected = false,
  }) {
    final isSelected = _selectedTier == value || selected;
    return InkWell(
      onTap: () => setState(() => _selectedTier = value),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.goldLight : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent, width: 2),
          boxShadow: const [
            BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, 2))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textNavy, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: GoogleFonts.plusJakartaSans(
                        color: AppColors.muted, fontSize: 12)),
              ],
            ),
            Row(
              children: [
                Text(price,
                    style: GoogleFonts.plusJakartaSans(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                const SizedBox(width: 8),
                Radio<TicketTier>(
                  value: value,
                  groupValue: _selectedTier,
                  onChanged: (v) => setState(() => _selectedTier = v!),
                  activeColor: AppColors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption({
    required String label,
    required IconData icon,
    required PaymentMethod value,
    bool selected = false,
  }) {
    final isSelected = _selectedPayment == value;
    return InkWell(
      onTap: () => setState(() => _selectedPayment = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.goldLight : Colors.white,
          border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? AppColors.primary : AppColors.muted),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label,
                  style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textNavy,
                      fontWeight: FontWeight.w500,
                      fontSize: 15)),
            ),
            Radio<PaymentMethod>(
              value: value,
              groupValue: _selectedPayment,
              onChanged: (v) => setState(() => _selectedPayment = v!),
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
