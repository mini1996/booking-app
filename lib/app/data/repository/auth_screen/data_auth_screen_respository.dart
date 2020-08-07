import 'package:bookingapp/app/domain/repository/auth_screen/auth_screen.respository.dart';
import 'package:bookingapp/app/utils/http_helper.dart';
import 'package:bookingapp/constants/endpoints.dart';

// OfflineHelper offlineHelper = OfflineHelper();
HttpHelper httpHelper = HttpHelper();

class DataAuthScreenRepository implements AuthScreenRepository {
  loginUser(data) async {
    return await httpHelper.authRequest(
      data: data,
      endPoint: Endpoints.loginUrl,
    );
  }

  getResponse({success = false, data, message = "No message present"}) {
    Map responseModified = {
      "success": success,
      "message": message,
      "data": data,
    };
    return responseModified;
  }
}
