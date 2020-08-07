import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Settings {
  Settings._();
  static const String appName = "appname";
  static const String baseUrl = "baseurl";
  static const httpRequestTimeout = const Duration(seconds: 20);

  static get path async {
    Directory documentsDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return documentsDirectory.path;
  }

  static get picturePath async {
    return await path + ORIGINALIMAGEPATH;
  }

  static const String THUMBNAILPATH = "/thumbnail";
  static const String DELETEPATH = "/delete";
  static const String ORIGINALIMAGEPATH = "/originalimage";

  static get thumbnailPath async {
    return await path + THUMBNAILPATH;
  }
}
