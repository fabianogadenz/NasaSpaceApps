import 'package:onesignal_flutter/onesignal_flutter.dart';
class BlocHome{

  void initOneSignal(){

    OneSignal.shared.init("e154bfe0-7b0e-4f85-bbf7-da17761f41ce");
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
    OneSignal.shared.setExternalUserId("teste");

  }

}