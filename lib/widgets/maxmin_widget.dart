import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/wheather_model.dart';

class MaxMinWidget extends StatelessWidget {
  const MaxMinWidget({
    super.key,
    required this.wheatherModelData,
  });

  final WheatherModel? wheatherModelData;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Max",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "${wheatherModelData!.main.tempMax.toString()} º",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            width: 4.w,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 8),
            child: VerticalDivider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Min",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "${wheatherModelData!.main.tempMin.toString()} º",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
