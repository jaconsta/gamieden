import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final String fullPrice;
  final String currentPrice;
  final int discountPercent;

  const Price({
    super.key,
    required this.fullPrice,
    required this.currentPrice,
    required this.discountPercent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    if (discountPercent == 0) {
      return Container(
        margin: EdgeInsets.only(left: 50),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        width: width,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currentPrice,
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(
        left: 50 + (((discountPercent / 100)) * (width / 3)),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      width: width,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            currentPrice,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                fullPrice,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                " (- $discountPercent %)",
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
