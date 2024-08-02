import 'package:flutter/material.dart';
import 'package:treemap_challenge/src/views/components/tree_map_item.dart';

class TreeMapContainer extends StatelessWidget {
  final List<TreeMapItem> widgets;

  const TreeMapContainer({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    double totalPercentage =
        widgets.fold(0, (sum, item) => sum + item.percentage);

    return LayoutBuilder(
      builder: (context, constraints) {
        double totalArea = constraints.maxWidth * constraints.maxHeight;
        double currentX = 0;
        double currentY = 0;
        double currentWidth = constraints.maxWidth;
        double currentHeight = constraints.maxHeight;

        List<Widget> positionedWidgets = [];

        for (var item in widgets) {
          double proportion = item.percentage / totalPercentage;
          double itemArea = proportion * totalArea;

          if (currentWidth > currentHeight) {
            double itemWidth = itemArea / currentHeight;
            positionedWidgets.add(Positioned(
              left: currentX,
              top: currentY,
              width: itemWidth,
              height: currentHeight,
              child: item,
            ));
            currentX += itemWidth;
            currentWidth -= itemWidth;
          } else {
            double itemHeight = itemArea / currentWidth;
            positionedWidgets.add(Positioned(
              left: currentX,
              top: currentY,
              width: currentWidth,
              height: itemHeight,
              child: item,
            ));
            currentY += itemHeight;
            currentHeight -= itemHeight;
          }
        }

        return Stack(children: positionedWidgets);
      },
    );
  }
}
