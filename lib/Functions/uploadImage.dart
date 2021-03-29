
import 'dart:convert';

import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:http/http.dart' as http;


uploadImages(image , String name , state) async {
  Uri uri =
  Uri.parse("$serverURL/api/Upload/Post");
  http.MultipartRequest request = http.MultipartRequest("POST", uri);
  List<int> imageData = image;
  http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
    'File',
    imageData,
    filename: name,
  );
  request.files.add(multipartFile);
// send
  var response = await request.send();

  return response;
}