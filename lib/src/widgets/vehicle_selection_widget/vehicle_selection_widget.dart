import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class VehicleSelectionWidget extends StatelessWidget {
  final String vehicle;
  final String image;
  final bool selected;
  final Color selectedColor = Color(AppColors.PINK);
  final Color unselectedColor = Colors.white;

  VehicleSelectionWidget({
    Key key,
    @required this.vehicle,
    @required this.image,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      padding: EdgeInsets.all(
        ScreenUtil().setWidth(15),
      ),
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(90),
            decoration: BoxDecoration(
        color: selected ? selectedColor : unselectedColor,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(15),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                vehicle,
                style: TextStyle(
                  color: (selected) ? Colors.white : Colors.black,
                  fontSize: FontSize.fontSize14,
                ),
              ),
              // Expanded(child: SizedBox()),
              if (selected) ...[
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: FontSize.fontSize14,
                ),
              ],
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(12),
          ),
          Image.network(image)
          // Image(
          //   image: NetworkImage(image),
          //   fit: BoxFit.cover,
          // )
        ],
      ),
    );
  }
}
