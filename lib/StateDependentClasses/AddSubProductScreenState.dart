import 'package:elmolad_dashboard/Functions/uploadImage.dart';
import 'package:file_picker/file_picker.dart';
class AddSubProductScreenState {
  final state;

  AddSubProductScreenState(this.state);

  Future<void> loadAssets() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'gif', 'png'],
    );

    if (result != null) {
      result.files.forEach((element) {
        uploadImages(element.bytes.buffer.asUint8List() , "da");
      });
    } else {
      // User canceled the picker
    }
  }
}
