import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconNav extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;
  final Color selectedColor;

  const IconNav({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () => onTap(), //눌리면 받은 메서드 실행
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: FaIcon(
              icon,
              size: 24,
              color: isSelected ? selectedColor : selectedColor.withAlpha(100),
            ),
          ),
        ),
      ),
    );
  }
}
