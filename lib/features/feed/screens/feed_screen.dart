import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgCream,
      body: CustomScrollView(
        slivers: [
          // Fixed Top Header
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.bgCream.withValues(alpha: 0.9),
            elevation: 0,
            titleSpacing: 16,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shalom, Akosua',
                  style: GoogleFonts.dmSerifDisplay(
                    color: AppColors.navy,
                    fontSize: 28,
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 2),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuAVHMXRNvdmc92ZuTgIAILuHax6y6gtyU9Tmo1XgD_jaQCru6oVYjSkiTNpZHNJOVaiE7mxThyVHOEINXHqzbdEUQUXbC9B0-bQv38dnXFHg_s8DdopldYn08BAWZJuINH9adlakdthvGIzH1sJ4A5vb8lC8gdKAxLq3-ByE7ZFX_7pOo-S5mlBmL8M6ajCwFfPXgb9FJ434O_B2uLfKq-LL4DMLvXbULMJROkOBLp9CykinDPlqZ-W2-dV9GmdjPpWFP6MJTWU86SK',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Main Content Area
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                
                // Hero Event Card
                Container(
                  height: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.navy.withValues(alpha: 0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCkw87EfCE02gqN4WqT3TCEaFjn0jmMVrfZ887Phka373a4dyioFdgUC38EZvJBc7Tqo2I1P4MYG0qzYuFVbbyDs1bEtDenkmFYR_pipBEYHHxERexjD_hRfZRiMqttBgBbxJ_BZWQ3Lj-8qvmUjdMeXi5GzpdPaIGIp3MBkdIiQhrZI2n7euoWFuD5EGb0GlIGo1QiXivtF4_qYoyYSAkEnt4UkvcwKW_F15tFtvIZkKHmcGpkYaGJINPD_2yKj8k1JKwxPzamKL6Z',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Deep Navy Gradient Overlay
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.navy,
                              AppColors.navy.withValues(alpha: 0.4),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      
                      // Event Info
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Crossover Service at Perez Dome',
                              style: GoogleFonts.dmSerifDisplay(
                                color: AppColors.white,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  color: AppColors.white,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Dec 31 • Perez Dome',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: AppColors.white.withValues(alpha: 0.9),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Free Entry Badge
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.bgCream,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            'Free Entry',
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColors.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // Section Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Gatherings',
                      style: GoogleFonts.dmSerifDisplay(
                        color: AppColors.navy,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Event Cards List
                _buildEventCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAk-LzJhy5C19ZYwDhlju7i646hlplleXrv9iyezLAXxlr3SDj7d9YIdr2csxLaRd5fXjRmi025aNpO0pos6ic2ydWmW7_j29bwGFWnCJ-y8IO8fqBzBJuRuQ1dTQlRttq0-_c2IUfXNLuAM-fE-CxntyEixeRQDBm3IseaZhZYFEmn1zmbOceZ10j-OvsNnk7WsET7h3dhbDbGcuBfoISRrwVS1LaEP0Jih8nw_7eA5ArRlnOj4AQofQ6KierZ5IvphIBIWJkWIoPN',
                  title: 'ICGC Christ Temple - Greater Works',
                  time: 'Sun, 9:00 AM',
                  price: '50 GHS',
                ),
                
                const SizedBox(height: 16),
                
                _buildEventCard(
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkEihjGFEERopYBxrWKmrdpZDzGfJXJj9JoViutWVoLwpNiaTU185HtLvFXtJgW_I7T7FZ2fqRp6GEdOUoLgkX-Ck4cqVbqk3P6EkcatDO3jGzDJnWx4c45GsOo_cSuiNBe5PPYnJSLYasnaqk0YhYqMJGNIU4Lxw6cDIm2coU1pebufYsDw3XUidEP4RNAy_eJZ6K9dMVhka8xAyD9neSsjtXguClHztz9ni_nSBBqBJ6pC79QbO8unZ7f9k5au3lGtXzVORSQZBL',
                  title: 'Action Chapel - Night of Encounter',
                  time: 'Fri, 6:00 PM',
                  price: 'Free Entry',
                ),
                
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String imageUrl,
    required String title,
    required String time,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSerifDisplay(
                    color: AppColors.navy,
                    fontSize: 18,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: AppColors.muted,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.muted,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.bgCream,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    price,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
