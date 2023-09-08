import 'package:chamran/model/dashboard/dashboard.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem({
    required this.dashboard,
    required this.selected,
    required this.onSelect,
    super.key,
  });
  final Dashboard dashboard;
  final bool selected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .05,
        vertical: size.height * .005,
      ),
      child: Material(
        color: selected ? const Color(0xFF147D77) : AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onSelect,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .02,
              horizontal: size.width * .04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  dashboard.title ?? 'UNKNOWN',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Shabnam',
                    fontSize: size.width * .035,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: size.width * .04),
                const Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
