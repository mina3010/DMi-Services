import 'package:collection/collection.dart';
import 'package:DMI/core/constants.dart';
import 'package:DMI/core/res/app_dimensions.dart';
import 'package:flutter/material.dart';

class PaginationList extends StatefulWidget {
  final List currentList;
  final Widget Function(BuildContext, int) itemBuilder;
  final void Function() nextPage;
  final bool isLoadingMore;
  final bool isNoMore;
  final bool wrapping;
  final bool hasFirstItem;
  final bool isHorizontalScroll;
  final bool hasDivider;
  final EdgeInsets listPadding;

  const PaginationList({
    Key? key,
    required this.currentList,
    required this.nextPage,
    required this.itemBuilder,
    this.isLoadingMore = false,
    this.isNoMore = false,
    this.wrapping = false,
    this.hasFirstItem = false,
    this.isHorizontalScroll = false,
    this.hasDivider = true,
    this.listPadding = const EdgeInsets.symmetric(
      vertical: AppDMIensions.padding_8,
      horizontal: AppDMIensions.padding_16,
    ),
  }) : super(key: key);

  @override
  State<PaginationList> createState() => _PaginationListState();
}

class _PaginationListState extends State<PaginationList> {
  final ScrollController _listViewScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listViewScrollController.addListener(() => _loadMore(context));
  }

  void _loadMore(BuildContext context) {
    if (_listViewScrollController.position.extentAfter <
        Constants.scrollControllerExtentAfterNextPage) {
      widget.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return (widget.wrapping)
        ? SingleChildScrollView(
            controller: _listViewScrollController,
            child: Align(
              alignment: TranslationsConstants.isLTR(context)
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: Wrap(
                runSpacing: AppDMIensions.defaultHeightSeparated_12,
                spacing: AppDMIensions.defaultHeightSeparated_16,
                alignment: WrapAlignment.spaceBetween,
                children:
                    List.generate(
                            widget.currentList.length +
                                ((widget.isLoadingMore || widget.isNoMore)
                                    ? 1
                                    : 0) +
                                ((widget.hasFirstItem) ? 1 : 0),
                            (index) => index)
                        .mapIndexed((i, e) => widget.itemBuilder(context, i))
                        .toList(),
              ),
            ),
          )
        : ListView.separated(
            controller: _listViewScrollController,
            scrollDirection:
                (widget.isHorizontalScroll) ? Axis.horizontal : Axis.vertical,
            padding: widget.listPadding,
            itemCount: widget.currentList.length +
                ((widget.isLoadingMore || widget.isNoMore) ? 1 : 0) +
                ((widget.hasFirstItem) ? 1 : 0),
            itemBuilder: widget.itemBuilder,
            separatorBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  if (!widget.isHorizontalScroll && widget.hasDivider)
                    const Divider(),
                  SizedBox(
                    height: (widget.isHorizontalScroll)
                        ? 0
                        : AppDMIensions.defaultHeightSeparated_8,
                    width: (widget.isHorizontalScroll)
                        ? AppDMIensions.defaultHeightSeparated_8
                        : 0,
                  ),
                ],
              );
            },
          );
  }
}
