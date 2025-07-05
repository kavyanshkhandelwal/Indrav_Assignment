import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

const Color accentColor = Color(0xFF6366F1);

class AgeGroupPage extends StatefulWidget {
  const AgeGroupPage({super.key});

  @override
  State<AgeGroupPage> createState() => _AgeGroupPageState();
}

class _AgeGroupPageState extends State<AgeGroupPage> {
  String? _selectedGroup;
  bool _isHovered = false;

  final List<String> _ageGroups = [
    '18–20',
    '21–25',
    '26–30',
    '31–35',
    '36–40',
    '41+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with 3D animation
          Positioned.fill(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.shade600.withOpacity(0.8),
                        Colors.blue.shade700.withOpacity(0.6),
                        Colors.blue.shade800.withOpacity(0.4),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Lottie.asset(
                    'assets/animations/3d_background.json',
                    repeat: true,
                    fit: BoxFit.cover,
                    frameRate: FrameRate.max,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text('Animation loading...'));
                    },
                  ),
                ),
                Container(color: Colors.black.withOpacity(0.3)),
              ],
            ),
          ),
          // Centered Age Group Card
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 360,
                constraints: const BoxConstraints(
                  maxWidth: 360,
                  maxHeight: 600,
                ),
                child: GlassCard(
                  width: 360,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        'Choose your age group:',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 16),
                      ..._ageGroups.map(
                        (group) => MouseRegion(
                          onEnter: (_) => setState(() => _isHovered = true),
                          onExit: (_) => setState(() => _isHovered = false),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: RadioListTile<String>(
                              title: Text(
                                group,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              value: group,
                              groupValue: _selectedGroup,
                              onChanged: (value) {
                                setState(() => _selectedGroup = value);
                              },
                              activeColor: accentColor,
                              selected: _selectedGroup == group,
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MouseRegion(
                          onEnter: (_) => setState(() => _isHovered = true),
                          onExit: (_) => setState(() => _isHovered = false),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _selectedGroup != null
                                  ? () {
                                      // Show selected age group message
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Age group "$_selectedGroup" selected'),
                                          backgroundColor: Colors.black87,
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      );
                                      
                                      // Navigate back to login page after selection
                                      Navigator.of(context).pop();
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
