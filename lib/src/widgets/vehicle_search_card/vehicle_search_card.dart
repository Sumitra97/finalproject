import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/sawaari_table_row/saawari_table_row.dart';

class VehicleSearchCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final double consumption;
  final Function book;
  final int days;

  const VehicleSearchCard({
    Key key,
    @required this.name,
    @required this.price,
    @required this.consumption,
    @required this.image,
    @required this.days,
    this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(5),
        left: ScreenUtil().setWidth(5),
        right: ScreenUtil().setWidth(5),
        bottom: ScreenUtil().setHeight(10),
      ),
      height: ScreenUtil().setHeight(124),
      decoration: BoxDecoration(
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '$name',
                style: TextStyle(
                  fontSize: FontSize.fontSize14,
                ),
              ),
              Expanded(child: SizedBox()),
              Icon(
                Icons.remove_red_eye,
                color: Colors.black45,
                size: FontSize.fontSize16,
              ),
              SizedBox(width: ScreenUtil().setWidth(5)),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(15),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(
                            ScreenUtil().setWidth(10),
                          ),
                          width: ScreenUtil().setWidth(300),
                          height: ScreenUtil().setHeight(400),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '$name',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: FontSize.fontSize14,
                                ),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(5)),
                              Image.asset(
                                image,
                                width: ScreenUtil().setWidth(200),
                                height: ScreenUtil().setHeight(100),
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(5)),
                              Text(
                                'Fare Breakup',
                                style: TextStyle(
                                  fontSize: FontSize.fontSize14,
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setSp(1),
                                color: Colors.black12,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              Text(
                                '$days day(s)',
                                style: TextStyle(
                                  fontSize: FontSize.fontSize14,
                                ),
                              ),
                              Container(
                                height: ScreenUtil().setSp(1),
                                color: Colors.black12,
                              ),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                columnWidths: {
                                  0: FixedColumnWidth(
                                    ScreenUtil().setWidth(180),
                                  ),
                                },
                                children: [
                                  sawaariTableRow(
                                    title: 'Total Rent*',
                                    value: '6000',
                                  ),
                                  sawaariTableRow(
                                    title: 'Goods and Services Tax',
                                    value: '6000',
                                  ),
                                  sawaariTableRow(
                                    title: 'Discount',
                                    value: '6000',
                                  ),
                                  sawaariTableRow(
                                    title: 'Refundable Deposit',
                                    value: '6000',
                                  ),
                                  sawaariTableRow(
                                    title: 'Playable Amount',
                                    value: '6000',
                                  ),
                                  sawaariTableRow(
                                    title:
                                        'Total Paying Amount (Inc. Refundable Deposit)',
                                    value: '6000',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(20),
                              ),
                              Center(
                                child: RaisedButton(
                                  onPressed: () {},
                                  color: Color(AppColors.GREEN),
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSize.fontSize14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Text(
                  'Fare Details',
                  style: TextStyle(
                    fontSize: FontSize.fontSize12,
                    color: Colors.redAccent,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(30),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total Fee: Nrs. $price',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                      ),
                    ),
                    Text(
                      'Consumption: $consumption Ltr/Km',
                      style: TextStyle(
                        fontSize: FontSize.fontSize12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(AppColors.GREEN),
                          onPressed: book,
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.fontSize12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
