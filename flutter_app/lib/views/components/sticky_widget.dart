import 'package:flutter/material.dart';

class StickyWidget extends StatelessWidget {
  final Widget widget;
  final double minHeight;
  final double maxHeight;

  StickyWidget({
    required this.widget,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: StickyWidgetDelegate(
        widget,
        minHeight,
        maxHeight,
      ),
    );
  }
}

class StickyWidgetDelegate extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final double min;
  final double max;

  StickyWidgetDelegate(
    this.widget,
    this.min,
    this.max,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => this.max;

  @override
  double get minExtent => this.min;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
