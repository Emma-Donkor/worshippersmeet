import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top App Bar with back & share
      body: SafeArea(
        child: Stack(
          children: [
            // Parallax hero image
            Positioned.fill(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDJ8fS8puqNFPTezjrfg44ouO8JCo1DrimmuEmkr9oYu8Gj0I1IO6QJa-7raovq6F0YNg8D44Vk1yRbTou3TXQacionNMdPoBfm0Jc8-aRvA6E3Xj9zmNK-AA1UCwn8FijsrfWQiDpYuqFmNarGu7l4jgLBtE11gBvK275_8J61d5Y8e_tZ-ppcRuO-eogl9BntpTOsl3_h0SmBUlSromyVMqQ06UIKVPKPPEoBI9AVl0mCtOn9o7xMiA1PlyUotvQ4B30SE_gx97Q5',
                fit: BoxFit.cover,
              ),
            ),
            // Dark gradient overlay for readability
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0x99000000),
                      Color(0x66000000),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Main content sheet
            Positioned(
              top: 250 - 30, // overlap hero image
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Handle bar
                      Center(
                        child: Container(
                          width: 48,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: AppColors.muted.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      // Title block
                      Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.bgCream,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Conference',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Action Chapel - Night of Encounter',
                              style: GoogleFonts.dmSerifDisplay(
                                color: AppColors.navy,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month, color: AppColors.primary, size: 20),
                                const SizedBox(width: 8),
                                const Text('Friday, Oct 24 • 18:00 - 22:00', style: TextStyle(fontSize: 15, color: AppColors.muted)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on, color: AppColors.primary, size: 20),
                                const SizedBox(width: 8),
                                const Text('The Prayer Cathedral\nSpintex Road, Accra',
                                    style: TextStyle(fontSize: 15, color: AppColors.muted)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Gold accent line
                      Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0x80D3A117),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      // Ministers horizontal list
                      Text('Officiating Ministers', style: GoogleFonts.dmSerifDisplay(color: AppColors.navy, fontSize: 20)),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _ministerCards(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Order of Service timeline
                      Text('Order of Service', style: GoogleFonts.dmSerifDisplay(color: AppColors.navy, fontSize: 20)),
                      const SizedBox(height: 12),
                      _timeline(),
                      const SizedBox(height: 80), // space for sticky CTA
                    ],
                  ),
                ),
              ),
            ),
            // Top app bar buttons (floating)
            Positioned(
              top: 12,
              left: 16,
              child: _iconButton(Icons.arrow_back, () => context.pop()),
            ),
            Positioned(
              top: 12,
              right: 16,
              child: _iconButton(Icons.share, () {}),
            ),
            // Sticky bottom CTA
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => context.push('/checkout'),
                  child: const Text('Get Tickets', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white30),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  List<Widget> _ministerCards() {
    const ministers = [
      {
        'name': 'Archbishop Duncan-Williams',
        'url': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDeHfwXgPGjKYmnIPNvB2_pXgSr03O_nv5v0ceQvXN1atfLkbT50jfd4rlVsZllscKOLhxR9OZaaxoqIerNx0RCF3pV0d9MWGP0MqyK1SLyr4u0vA-TY_rv80S2chiXO1_dFWH1XEFgv-Jtld-P0J62TaYkd9yCH_MHJokDA8XBcL4OIynN2auzwqR_8NCee4KaKKwJSgJswTDaxHdJXAmqZ20Ttk4TPH2rVIBYyYo7PVdcaR8dBQi1BH2B_y-lBqjaaTo34wZUeF5N',
      },
      {
        'name': 'Bishop James Saah',
        'url': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDjms0vppMEopG9siDdMh5JgwYS-qz4UlyxitvqFc2SQ1y8g6xg13ZPKr8zCsDZr1EI8ww4URUJrprf6EjJTNmJwikzJyNtvhYV9eKpbwZlSQrQaQKM6-oRlthPepWFXb5GrZqfr-UNYEE7WaqHN6Q89GEBJgJYISMLJZxA6DsBSPCmeQb2AClzslx3u_R_fvks6N8xw9HIGz5gA8d4SbaTgUPHNBwSR4icId1B7xejZArQ0rmDZBXUOrCq0hukiSLl1AQNqZ95e1fK',
      },
      {
        'name': 'Rev. Eastwood Anaba',
        'url': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB0cVEKfYUGjswR88zT-CE3T4e_wyIrjrknqazFtCEUZwat39uakgP2XEb4X-w4wOSI1qypG7OSi2BLxhVkDSsuh2Wh-zSfRFWG63_KUVxfn_rVkDZoANOcgvGmG6u_nuJkw-g_yYhx0dRKSf0zjriSHc1KV2rcAy8SIsdWeVEZeJYHyjuEeRApCTdsfPbVDCr4KXmR-0AoJWl1xoJku9jy1qaZhhcii22Jwsffh29xoof4s-qHYKgOQ_zrpUC2WfAxLQadtdVYiYP-',
      },
    ];
    return ministers.map((m) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(m['url']!),
            ),
            const SizedBox(height: 8),
            Text(m['name']!, style: GoogleFonts.plusJakartaSans(color: AppColors.navy, fontSize: 13)),
          ],
        ),
      );
    }).toList();
  }

  Widget _timeline() {
    final items = [
      {'time': '18:00 - 18:30', 'title': 'Arrival & Registration', 'desc': 'Settle in and prepare your hearts for a mighty move of God.'},
      {'time': '18:30 - 19:45', 'title': 'Intense Praise & Worship', 'desc': 'Led by the Action Chapel Choir. A time of deep spiritual communion.'},
      {'time': '20:00 - 22:00', 'title': 'The Ministration of the Word', 'desc': 'Prophetic teaching and impartation by the Archbishop.'},
    ];
    return Column(
      children: items.map((it) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  Container(width: 2, height: 60, color: AppColors.muted),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(it['time']!, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(it['title']!, style: GoogleFonts.dmSerifDisplay(color: AppColors.navy, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(it['desc']!, style: const TextStyle(color: AppColors.muted)),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
