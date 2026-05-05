import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onSelected;

  const FilterSection({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: filters.map((filter) {
        final bool isSelected = selectedFilter == filter;

        final Color activeColor = filter == 'Praktikum'
            ? const Color(0xFF7FCFD1)
            : Color(0xFF87CEEB);

        return Expanded(
          child: GestureDetector(
            onTap: () => onSelected(filter),
            child: Container(
              height: 44,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: isSelected ? activeColor : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isSelected ? activeColor : const Color(0xFFE8DDD0),
                ),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: activeColor.withValues(alpha: 0.26),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                ],
              ),
              child: Center(
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 13,
                    color: isSelected
                        ? const Color(0xFF374151)
                        : const Color(0xFF6B7280),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}