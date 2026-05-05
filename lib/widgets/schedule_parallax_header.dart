import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ScheduleParallaxHeader extends StatelessWidget {
  final int totalClasses;

  const ScheduleParallaxHeader({super.key, required this.totalClasses});

  static const double expandedHeight = 180;
  static const double toolbarHeight = 78;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double currentHeight = constraints.maxHeight;

        final double minHeight = toolbarHeight + statusBarHeight;
        final double maxHeight = expandedHeight + statusBarHeight;

        final double progress =
            ((maxHeight - currentHeight) / (maxHeight - minHeight)).clamp(
              0.0,
              1.0,
            );

        final double decorationOffset = progress * -28;

        final double largeOpacity = (1.0 - (progress / 0.45)).clamp(0.0, 1.0);

        final double compactOpacity = ((progress - 0.45) / 0.35).clamp(
          0.0,
          1.0,
        );

        final bool showLargeHeader = progress < 0.50;
        final bool showCompactHeader = progress >= 0.42;

        return ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const _HeaderBackground(),

              _HeaderDecoration(offsetY: decorationOffset),

              if (showLargeHeader)
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 30,
                  child: Opacity(
                    opacity: largeOpacity,
                    child: const _LargeHeaderContent(),
                  ),
                ),

              if (showCompactHeader)
                Positioned(
                  left: 24,
                  right: 24,
                  top: statusBarHeight + 10,
                  child: Opacity(
                    opacity: compactOpacity,
                    child: _CompactHeaderContent(totalClasses: totalClasses),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.headerBlue, AppColors.headerBlue2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class _HeaderDecoration extends StatelessWidget {
  final double offsetY;

  const _HeaderDecoration({required this.offsetY});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: -32,
          top: 28 + offsetY,
          child: const _HeaderCircle(size: 130, opacity: 0.22),
        ),
        Positioned(
          left: -42,
          bottom: 12 - offsetY,
          child: const _HeaderCircle(size: 112, opacity: 0.14),
        ),
        Positioned(
          right: 60,
          bottom: -46 - offsetY,
          child: const _HeaderCircle(size: 104, opacity: 0.16),
        ),
        Positioned(
          right: 26,
          bottom: 30 - offsetY,
          child: Icon(
            Icons.calendar_month_rounded,
            size: 100,
            color: Colors.white.withAlphaValue(0.25),
          ),
        ),
      ],
    );
  }
}

class _LargeHeaderContent extends StatelessWidget {
  const _LargeHeaderContent();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, Ariani Putri Andini',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Daftar Kelas',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 27,
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Lihat jadwal teori dan praktikum dalam satu halaman',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.5,
                  color: AppColors.textMuted,
                  height: 1.32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 14),
        _HeaderIconBox(),
      ],
    );
  }
}

class _CompactHeaderContent extends StatelessWidget {
  final int totalClasses;

  const _CompactHeaderContent({required this.totalClasses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withAlphaValue(0.34),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withAlphaValue(0.40)),
            ),
            child: const Icon(
              Icons.calendar_month_rounded,
              color: AppColors.textDark,
              size: 23,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar Kelas',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$totalClasses kelas',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
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

class _HeaderIconBox extends StatelessWidget {
  const _HeaderIconBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white.withAlphaValue(0.36),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withAlphaValue(0.42)),
      ),
      child: const Icon(
        Icons.calendar_month_rounded,
        color: AppColors.textDark,
        size: 30,
      ),
    );
  }
}

class _HeaderCircle extends StatelessWidget {
  final double size;
  final double opacity;

  const _HeaderCircle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withAlphaValue(opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}