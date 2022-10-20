import 'dart:io';

Future<bool> deviceHasInternet() async {
  try {
    final data = await InternetAddress.lookup('google.com');
    return data.isNotEmpty && data[0].rawAddress.isNotEmpty;
  } catch (err) {
    return false;
  }
}
