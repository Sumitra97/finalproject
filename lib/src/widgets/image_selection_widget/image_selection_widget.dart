import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionWidget extends StatefulWidget {
  final String title;
  final String imageTitle;

  const ImageSelectionWidget({
    Key key,
    @required this.title,
    @required this.imageTitle,
  }) : super(key: key);

  @override
  _ImageSelectionWidgetState createState() => _ImageSelectionWidgetState(title);
}

class _ImageSelectionWidgetState extends State<ImageSelectionWidget> {
  String title;

  _ImageSelectionWidgetState(this.title);
  SharedPreferences preferences;
  File _image;

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  void initSharedPref() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return GestureDetector(
      onTap: () async {
        print('tapped');
        _image = await ImagePicker.pickImage(
          source: ImageSource.gallery,
        );
        if (_image != null)
          preferences?.setString(widget.imageTitle, _image.path);
        print(preferences?.get(widget.imageTitle));
        setState(() {});
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
        height: ScreenUtil().setHeight(120),
        width: ScreenUtil().setWidth(160),
        decoration: BoxDecoration(
          image: preferences?.get(widget.imageTitle) != null
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(
                    File(preferences?.get(widget.imageTitle)),
                  ),
                )
              : null,
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.black12,
              offset: Offset(0, 1),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: preferences?.get(widget.imageTitle) == null
              ? [
                  Icon(
                    Icons.file_upload,
                    color: Colors.black,
                  ),
                  Text(title),
                ]
              : [],
        ),
      ),
    );
  }
}
