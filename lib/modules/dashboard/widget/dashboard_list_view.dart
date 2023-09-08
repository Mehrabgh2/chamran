import 'package:chamran/model/dashboard/dashboard.dart';
import 'package:chamran/modules/dashboard/widget/dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DashboardListView extends StatelessWidget {
  const DashboardListView({
    required this.controller,
    required this.onSelect,
    required this.selected,
    super.key,
  });
  final PagingController<int, Dashboard> controller;
  final Function(Dashboard) onSelect;
  final Dashboard? selected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PagedListView<int, Dashboard>(
      padding: EdgeInsets.only(top: size.height * .01),
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<Dashboard>(
        noItemsFoundIndicatorBuilder: (context) => Center(
          child: Text(
            'داشبوردی یافت نشد',
            style: TextStyle(
              fontSize: size.width * .04,
              fontFamily: 'ShabnamBold',
              color: const Color(0xFF4F4F4F),
            ),
          ),
        ),
        newPageErrorIndicatorBuilder: (context) => Center(
          child: Text(
            'عملیات با مشکل مواجه شد',
            style: TextStyle(
              fontSize: size.width * .04,
              fontFamily: 'ShabnamBold',
              color: const Color(0xFF4F4F4F),
            ),
          ),
        ),
        firstPageErrorIndicatorBuilder: (context) => Center(
          child: Text(
            'عملیات با مشکل مواجه شد',
            style: TextStyle(
              fontSize: size.width * .04,
              fontFamily: 'ShabnamBold',
              color: const Color(0xFF4F4F4F),
            ),
          ),
        ),
        itemBuilder: (context, item, index) => DashboardItem(
          dashboard: item,
          selected: item.id == selected?.id,
          onSelect: () => onSelect(item),
        ),
      ),
    );
  }
}
