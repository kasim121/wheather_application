import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:wheather_app/provider/wheather_provider.dart';

import '../resource/style_manager.dart';

class WheatherHome extends StatefulWidget {
  const WheatherHome({super.key});

  @override
  State<WheatherHome> createState() => _WheatherHomeState();
}

class _WheatherHomeState extends State<WheatherHome> {
  DateTime nowTime = new DateTime.now();
  DateFormat formatter = new DateFormat('yyyy-MM-dd');
  late String latitude;
  late String longitude;

  @override
  void initState() {
    //    Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high)
    //     .then((position) {
    //   setState(() {
    //     latitude = position.latitude.toString();
    //     longitude = position.longitude.toString();
    //     print("latitude ${latitude}");
    //             print("longitude ${longitude}");
    //   });
    // });
   ///Provider.of<WheatherProvider>(context, listen: false).getDataFromAPI(latitude,longitude);
      Provider.of<WheatherProvider>(context, listen: false).getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wheatherDataProvider = Provider.of<WheatherProvider>(context);
    final wheatherModelData = wheatherDataProvider.wheatherModel;
    DateTime nowTime =  DateTime.now();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
       
          DateFormat.yMMMEd().format(nowTime),
          style: fontNormalStyle(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 140.h,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 10),
              //     child: SizedBox(
              //       height: 140.h,
              //       child: Consumer<WheatherProvider>(
              //         builder: (context, wheatherProvider, _) {
              //           if (wheatherProvider.weather.isEmpty) {
              //             return const Center(
              //               child: Text(
              //                 'No wheather found!.',
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.normal,
              //                   fontFamily: 'Poppins',
              //                   fontSize: 1,
              //                 ),
              //               ),
              //             );
              //           } else {
              //             return ListView.builder(
              //               shrinkWrap: true,
              //               scrollDirection: Axis.vertical,
              //               itemCount: wheatherProvider.weather.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 var wheatherListDetails =
              //                     wheatherProvider.weather[index];

              //                 return Column(
              //                   children: [
              //                     Text(
              //                       wheatherListDetails.main
              //                           .toString()
              //                           .toUpperCase(),
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontFamily: 'Poppins',
              //                         letterSpacing: 2,
              //                         fontWeight: FontWeight.w700,
              //                         fontSize: 30.sp,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       height: 15.h,
              //                     ),
              //                     Text(
              //                       wheatherListDetails.description
              //                           .toString()
              //                           .toUpperCase(),
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontFamily: 'Poppins',
              //                         letterSpacing: 2,
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: 30.sp,
              //                       ),
              //                     ),
              //                   ],
              //                 );
              //               },
              //             );
              //           }
              //         },
              //       ),
              //     ),
              //   ),
              // ),
          
                                  Center(
                                    child: Text(
                                      wheatherModelData!.name
                                          .toString()
                                          .toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Center(
                                    child: Text(
                                      wheatherModelData.weather[0].description
                                          .toString()
                                          .toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30.sp,
                                      ),
                                    ),
                                  ),
                              
                            
                          
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Container(
                  height: 120.h,
                  width: 120.w,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage("assets/images/rainy.jpeg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "${wheatherModelData!.main.tempMax.toString()} º",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 80.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              IntrinsicHeight(
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
                          "${wheatherModelData.main.tempMin.toString()} º",
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
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: DotsIndicator(
                  dotsCount: 2,

                  //position: currentIndexPage,
                  decorator: DotsDecorator(
                      color: Colors.grey, // Inactive color
                      activeColor: Colors.black,
                      size: Size.square(5),
                      activeSize: Size.square(5)),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Divider(
                thickness: 1.5,
              ),
              Spacer(),
              Divider(
                thickness: 1.5,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "wind speed",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "${wheatherModelData.wind.speed.toString()} m/s",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
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
                          "sunrise",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "${wheatherModelData.main.tempMin.toString()} PM",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
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
                          "sunset",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "${wheatherModelData.main.tempMin.toString()} PM",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
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
                          "humidity",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          wheatherModelData.main.humidity.toString(),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location services are denied.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanently denied, we cannot request.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
