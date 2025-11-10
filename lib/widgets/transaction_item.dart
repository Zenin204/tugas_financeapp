import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final TransactionModel transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  bool _isHovered = false;

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Food':
        return Icons.restaurant_menu_rounded;
      case 'Travel':
        return Icons.flight_rounded;
      case 'Health':
        return Icons.local_hospital_rounded;
      case 'Event':
        return Icons.event_rounded;
      case 'Income':
        return Icons.trending_up_rounded;
      case 'Shopping':
        return Icons.shopping_bag_rounded;
      case 'Utilities':
        return Icons.lightbulb_outline_rounded;
      default:
        return Icons.category_rounded;
    }
  }

  // Warna amount (merah/hijau) tetap sama
  Color _getAmountColor(String amount) {
    return amount.startsWith('-') ? Colors.red.shade400 : Colors.green.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isHovered ? 1.02 : 1.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.basic,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          // === PERUBAHAN: Kartu transaksi jadi gelap ===
          decoration: BoxDecoration(
            color: const Color(0xFF1A202C), // Latar gelap
            borderRadius: BorderRadius.circular(15),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]
                : [],
          ),
          // === BATAS PERUBAHAN ===
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
              foregroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(_getIconForCategory(widget.transaction.category), size: 24),
            ),
            // === PERUBAHAN: Teks jadi putih ===
            title: Text(
              widget.transaction.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
            subtitle: Text(
              widget.transaction.category,
              style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7)),
            ),
            // === BATAS PERUBAHAN ===
            trailing: Text(
              widget.transaction.amount,
              style: TextStyle(
                color: _getAmountColor(widget.transaction.amount),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}