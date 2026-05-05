import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SectionTitle extends StatelessWidget {
  final int totalClasses;

  const SectionTitle({super.key, required this.totalClasses});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Daftar Kelas',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const Spacer(),
        _ClassCountBadge(totalClasses: totalClasses),
      ],
    );
  }
}

class _ClassCountBadge extends StatelessWidget {
  final int totalClasses;

  const _ClassCountBadge({required this.totalClasses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.headerBlue.withAlphaValue(0.28),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$totalClasses kelas',
        style: const TextStyle(
          fontSize: 13,
          color: AppColors.textDark,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}