
import 'package:elmolad_dashboard/Constant/Url.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

uploadImages(image , String name) async {

  Uri uri =
  Uri.parse("$serverURL/api/Upload/Post");
  http.MultipartRequest request = http.MultipartRequest("POST", uri);
   List<int> imageData = image;
   print(imageData.length);
  http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
    'File',
    imageData,
    filename: name,
  );
  request.files.add(multipartFile);
// send
  StreamedResponse response = await request.send();

  return response;
}