import 'package:flutter/material.dart';
import '../common_functions/app_colors.dart';
import 'title_componenet.dart';

class HomeTemplate extends StatefulWidget {
  final bool automaticallyImplyLeading;
  final List<Widget> children;
  final int selectedIndex;
  final String? title;
  final int? titleFontSize;
  final String? subTitle;
  final Widget? iconWidget;
  final bool resizeToAvoidBottomInset;
  final Color? appBarColor;
  final Color? titleColor;
  final bool showIcon;
  final double? appBarHeight;
  const HomeTemplate({
    super.key,
    this.automaticallyImplyLeading = false,
    required this.children,
    required this.selectedIndex,
    this.title,
    this.subTitle,
    this.iconWidget,
    this.resizeToAvoidBottomInset = false,
    this.appBarColor,
    this.titleColor,
    this.showIcon = true,
    this.appBarHeight, this.titleFontSize=20,
  });

  @override
  State<HomeTemplate> createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(widget.appBarHeight ?? kToolbarHeight),
        child: AppBar(
          foregroundColor: widget.titleColor ?? Colors.white,
          backgroundColor: widget.appBarColor ?? AppColors.bgroundblue,
          elevation: 0,
          title: Row(
            children: [
              if (widget.title != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleCompomnent(
                      title: widget.title!,
                      fontSize: widget.titleFontSize,
                      style: TextStyle(
                        color: widget.titleColor ?? AppColors.appBGWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (widget.subTitle != null)
                      TitleCompomnent(
                        title: widget.subTitle!,
                        fontSize: 12,
                        style: const TextStyle(color: Colors.grey),
                      ),
                  ],
                ),
            ],
          ),
          actions: widget.showIcon
              ? [
                  IconButton(
                    icon: widget.iconWidget ?? const Icon(Icons.add),
                    onPressed: () {},
                  ),
                ]
              : [],
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.children,
                ],
              ),
            ),
          ),
          //Container()
        ],
      ),
    );
  }
}
