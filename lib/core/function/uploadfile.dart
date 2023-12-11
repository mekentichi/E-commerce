import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:file_picker/file_picker.dart';

uploadImage() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 100);

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

uploadFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: [
      'png',
      'PNG',
      'jpg',
      'JPG',
      'jpeg',
      'JPEG',
      'heic',
      'HEIF',
      'heif',
    ],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
