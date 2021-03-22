import 'package:http/http.dart' as http;


uploadImages(image , String name) async {
  Uri uri =
  Uri.parse("api/Upload/Post");
  http.MultipartRequest request = http.MultipartRequest("POST", uri);
  List<int> imageData = image;
  print(imageData);
  http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
    'File',
    imageData,
    filename: name,
  );
  request.files.add(multipartFile);
// send
//   var response = await request.send();
//   print(response.statusCode);
//
//   return response;
}