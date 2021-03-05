
import 'package:flutter/material.dart';
import 'package:myflutter/domain/helpers/theme_helper.dart';

class FilterArgumentRow extends StatelessWidget {
  final bool isColumn;

  const FilterArgumentRow(
      {Key key, this.isColumn = false, this.label, this.child})
      : super(key: key);
  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isColumn
        ? Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildItem())
        : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildItem());
  }

  List<Widget> _buildItem() {
    return <Widget>[
      Text(
        label,
        style: ThemeHelper.paragraph(color: Colors.grey),
      ),
      SizedBox(
        height: isColumn ? 8 : 0,
        width: isColumn ? 0 : 8,
      ),
      isColumn
          ? child
          : SizedBox(
        width: 150,
        child: child,
      )
    ];
  }
}
