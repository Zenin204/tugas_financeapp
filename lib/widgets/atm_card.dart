import 'package:flutter/material.dart';

// === PERUBAHAN: Diubah ke StatefulWidget ===
class AtmCard extends StatefulWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final Color color1;
  final Color color2;
  final IconData bankIcon;

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    required this.color1,
    required this.color2,
    required this.bankIcon,
  });

  @override
  State<AtmCard> createState() => _AtmCardState();
}

class _AtmCardState extends State<AtmCard> {
  // Variabel untuk melacak status hover
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // === PERUBAHAN: Dibungkus dengan AnimatedScale dan MouseRegion ===
    return AnimatedScale(
      scale: _isHovered ? 1.05 : 1.0, // Membesar 5% saat di-hover
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click, // Mengubah kursor
        child: Container(
          width: 320,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [widget.color1, widget.color2], // Gunakan 'widget.color1'
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              // Bayangan akan sedikit lebih besar saat di-hover
              BoxShadow(
                color: _isHovered
                    ? widget.color2.withOpacity(0.7)
                    : widget.color2.withOpacity(0.5),
                blurRadius: _isHovered ? 20 : 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.bankName, // Gunakan 'widget.bankName'
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(widget.bankIcon, color: Colors.white.withOpacity(0.8), size: 36),
                ],
              ),
              const Spacer(),
              const Text(
                'Current Balance',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                widget.balance, // Gunakan 'widget.balance'
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.cardNumber, // Gunakan 'widget.cardNumber'
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
    // === BATAS PERUBAHAN ===
  }
}