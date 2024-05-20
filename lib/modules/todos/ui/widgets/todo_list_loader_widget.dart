import 'package:flutter/material.dart';
import 'package:maids/core/constants/app_dimens.dart';
import 'package:maids/core/constants/app_radius.dart';
import 'package:maids/core/widgets/loader/base_shimmer.dart';

class TodoListLoaderWidget extends StatelessWidget {
  const TodoListLoaderWidget({
    super.key,
    this.itemCount = 15,
    this.withTitle = false,
  });

  final int itemCount;
  final bool withTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppDimens.space16,
        left: AppDimens.space16,
        bottom: AppDimens.space6,
      ),
      child: ListView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: List.generate(itemCount, (index) {
          return const TodoLoaderItemWidget();
        }),
      ),
    );
  }
}

class TodoLoaderItemWidget extends StatelessWidget {
  const TodoLoaderItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double cardRadius = AppRadius.cardRadius8;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppDimens.verticalPadding16,
      ),
      child: BaseShimmerWidget(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cardRadius),
          ),
          child: Container(
            height: 88,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(cardRadius),
              boxShadow: [
                // AppBoxShadow.todoShadow,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
