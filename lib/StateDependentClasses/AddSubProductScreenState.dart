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
    } else {
      // User canceled the picker
    }
  }
}
