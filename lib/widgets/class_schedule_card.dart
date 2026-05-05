import 'package:flutter/material.dart';
import '../models/class_schedule.dart';

class ClassScheduleCard extends StatelessWidget {
  final ClassSchedule schedule;

  const ClassScheduleCard({super.key, required this.schedule});

  String get roomText {
    final room = schedule.room.trim();

    if (room.toLowerCase().contains('lab')) {
      return room;
    }

    return 'Ruang $room';
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = schedule.colors.first;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withAlpha((0.24 * 255).round()),
            blurRadius: 18,
            spreadRadius: -3,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Container(
          constraints: const BoxConstraints(minHeight: 164),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: schedule.colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -36,
                top: -36,
                child: _CircleDecoration(size: 112, opacity: 0.16),
              ),
              Positioned(
                right: 32,
                bottom: -54,
                child: _CircleDecoration(size: 122, opacity: 0.10),
              ),
              Positioned(
                left: -42,
                bottom: -50,
                child: _CircleDecoration(size: 105, opacity: 0.08),
              ),
              Positioned(
                right: 18,
                top: 74,
                child: Icon(
                  schedule.icon,
                  size: 82,
                  color: Colors.white.withAlpha((0.12 * 255).round()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ClassIcon(icon: schedule.icon),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _ClassInfo(
                        title: schedule.title,
                        type: schedule.type,
                        className: schedule.className,
                        day: schedule.day,
                        time: schedule.time,
                        room: roomText,
                        lecturer: schedule.lecturer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleDecoration extends StatelessWidget {
  final double size;
  final double opacity;

  const _CircleDecoration({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((opacity * 255).round()),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ClassIcon extends StatelessWidget {
  final IconData icon;

  const _ClassIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.24 * 255).round()),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha((0.30 * 255).round())),
      ),
      child: Icon(icon, color: const Color(0xFF374151), size: 30),
    );
  }
}

class _ClassInfo extends StatelessWidget {
  final String title;
  final String type;
  final String className;
  final String day;
  final String time;
  final String room;
  final String lecturer;

  const _ClassInfo({
    required this.title,
    required this.type,
    required this.className,
    required this.day,
    required this.time,
    required this.room,
    required this.lecturer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _TypeBadge(text: type),
            Text(
              'Kelas $className',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF374151),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 17,
            height: 1.25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 10),
        _InfoLine(icon: Icons.schedule_rounded, text: '$day, $time'),
        const SizedBox(height: 6),
        _InfoLine(icon: Icons.location_on_rounded, text: room),
        const SizedBox(height: 6),
        _InfoLine(icon: Icons.person_rounded, text: lecturer),
      ],
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String text;

  const _TypeBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.24 * 255).round()),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withAlpha((0.22 * 255).round())),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11.5,
          color: Color(0xFF374151),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoLine({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: const Color(0xFF374151).withAlpha((0.82 * 255).round()),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: const Color(0xFF374151).withAlpha((0.82 * 255).round()),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}