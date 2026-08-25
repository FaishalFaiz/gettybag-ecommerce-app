import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class CategoriesWidget extends StatefulWidget {
  final List<String> genres;
  final String selectedGenre;
  final ValueChanged<String> onGenreSelected;

  const CategoriesWidget({
    super.key,
    required this.genres,
    required this.selectedGenre,
    required this.onGenreSelected,
  });

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: widget.genres.length,
        itemBuilder: (context, index) {
          final genre = widget.genres[index];
          final isSelected = genre == widget.selectedGenre;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(genre),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  widget.onGenreSelected(genre);
                }
              },
              backgroundColor: AppColors.surfaceSoft,
              selectedColor: AppColors.primary,
              labelStyle: AppTextStyles.buttonSm(
                color: isSelected ? Colors.white : AppColors.body,
              ).copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          );
        },
      ),
    );
  }
}
