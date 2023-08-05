import 'dart:async';


import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../models/wheather_model.dart';

class WheatherProvider extends ChangeNotifier {
  //static const apiEndpoint = "https://api.openweathermap.org/data/2.5/weather?lat=17.413828&lon=78.439758&appid=44b5f8bbece2b49404464ee1f7a12651";

  bool isLoading = true;
  String error = '';
  WheatherModel? wheatherModel;
  List<Weather> weather = [];
// final Connectivity _connectivity = Connectivity();
// String status = 'waiting...';
// late StreamSubscription _streamSubscription;
  Future<void> getDataFromAPI(String latitude, longitude) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=44b5f8bbece2b49404464ee1f7a12651'));
      //  var response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        wheatherModel = wheatherModelFromJson(response.body);
        weather = wheatherModel!.weather;
        debugPrint("printing.. ${wheatherModel!.name.toString()}");
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

//  void checkConnectivity() async {
//     var connectionResult = await _connectivity.checkConnectivity();
//     if (connectionResult == ConnectivityResult.mobile) {
//       status = "Connected to MobileData";
//       notifyListeners();
//     } else if (connectionResult == ConnectivityResult.wifi) {
//       status = "Connected to Wifi";
//       notifyListeners();
//     } else {
//       status = "Offline";
//       notifyListeners();
//     }
//  }
  
// void checkRealtimeConnection() {
//   _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
//     switch (event) {
//       case ConnectivityResult.mobile:
//         {
//           status = "Connected to MobileData";
//           notifyListeners();
//         }
//         break;
//       case ConnectivityResult.wifi:
//         {
//           status = "Connected to Wifi";
//           notifyListeners();
//         }
//         break;
//       default:
//         {
//           status = 'Offline';
//           notifyListeners();
//         }
//         break;
//     }
//   });
// }

}
