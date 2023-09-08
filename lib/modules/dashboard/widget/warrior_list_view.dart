import 'package:chamran/model/dashboard/dashboard_tab.dart';
import 'package:chamran/util/app_theme.dart';
import 'package:flutter/material.dart';

class WarriorListView extends StatelessWidget {
  const WarriorListView({
    required this.tabs,
    required this.selectedTab,
    required this.onSelect,
    super.key,
  });
  final List<DashboardTab?> tabs;
  final DashboardTab? selectedTab;
  final Function(DashboardTab?) onSelect;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: tabs.length,
      itemBuilder: (context, index) {
        DashboardTab? tab = tabs.elementAt(index);
        if (tab == null) {
          return const SizedBox();
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * .05,
            vertical: size.height * .005,
          ),
          child: Material(
            color: selectedTab?.id == tab.id
                ? const Color(0xFF147D77)
                : AppTheme.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => onSelect(tab),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .02,
                  horizontal: size.width * .04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      tab.title != null
                          ? '( رزمنده ${index + 1} ) ${tab.title}'
                          : 'رزمنده ${index + 1}',
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
      },
    );
  }
}
