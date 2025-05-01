import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nadros/core/utils/colors.dart';
import 'package:nadros/core/utils/consts.dart';
import 'package:nadros/core/widgets/rounded_container.dart';

class TTabBar extends StatefulWidget {
  const TTabBar({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.backgroundColor = Colors.transparent,
    required this.tabColor,
    this.selectedTextColor = TColors.primary,
  });

  final List<String> tabs;
  final List<Widget> tabViews;
  final Color backgroundColor;
  final Color tabColor;
  final Color selectedTextColor;

  @override
  State<TTabBar> createState() => _TTabBarState();
}

class _TTabBarState extends State<TTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          selectedTabIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode;
    return Expanded(
      child: Column(
        children: [
          Material(
            color: widget.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.only(right: 12.w),
                dividerColor: Colors.transparent,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                dividerHeight: 0,
                tabs: List.generate(widget.tabs.length, (index) {
                  final isSelected = selectedTabIndex == index;
                  return Tab(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTabIndex = index;
                          _tabController.index = index;
                        });
                      },
                      child: TRoundedContainer(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                        backgroundColor: isSelected ?  widget.tabColor : widget.backgroundColor,
                        radius: isSelected ? 4 : 4,
                        child: Text(
                          widget.tabs[index],
                          style: TextStyle(
                            color: isSelected ? widget.selectedTextColor : TColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          TConsts.spaceBtwSections.verticalSpace,
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: widget.tabViews,
            ),
          ),
        ],
      ),
    );
  }
}