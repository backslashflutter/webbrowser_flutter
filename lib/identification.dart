import 'dart:io';
import 'package:device_info/device_info.dart';

Future<String> identificationDevice() async{

  if(Platform.isAndroid) {
 // Android のとき
  print("Andoroidです！！");
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // print('Running on ${androidInfo.androidId}');
  print(androidInfo.androidId);
  return androidInfo.androidId;
  
} else{
 // iOSのとき
  print("iOSです！！");
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
  // print('Running on ${iosDeviceInfo.identifierForVendor}');  // => iOS UUID 出力
  return iosDeviceInfo.identifierForVendor;
}
}