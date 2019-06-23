import 'package:flutter/material.dart';
import 'package:sawari/src/assets/assets.dart';

TableRow sawaariTableRow({
  @required String title,
  @required String value,
}) {
  return TableRow(
    children: [
      Text(
        '$title',
        style: TextStyle(
          fontSize: FontSize.fontSize12,
        ),
      ),
      Text(
        'Nrs. $value',
        style: TextStyle(
          fontSize: FontSize.fontSize12,
        ),
      ),
    ],
  );
}
