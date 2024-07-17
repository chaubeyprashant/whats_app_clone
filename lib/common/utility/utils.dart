import 'dart:developer';
import 'dart:io';
//import 'package:enough_giphy_flutter/enough_giphy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File croppableimage = File(pickedImage.path);
      image = await cropfile(croppableimage);
    }
  } catch (e) {
    log(e.toString());
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}

Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? video;
  try {
    final pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedVideo != null) {
      video = File(pickedVideo.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return video;
}

Future<File?> cropfile(File finalpickedfile) async {
  CroppedFile? croppedfile = await ImageCropper().cropImage(
      sourcePath: finalpickedfile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));

  File finalcroppedfile = File(croppedfile!.path);
  return await compressfile(finalcroppedfile.path);
}

Future<File?> compressfile(String path) async {
  final targetPath = p.join(
    (await getTemporaryDirectory()).path,
    '${DateTime.now().millisecondsSinceEpoch}${p.extension(path)}',
  );

  final XFile? compressedFile = await FlutterImageCompress.compressAndGetFile(
    path,
    targetPath,
    quality: 50,
  );

  if (compressedFile == null) {
    log("File compression failed");
    return null;
  }

  log("File compressed successfully");
  return File(compressedFile.path);
}


// Future<GiphyGif?> pickGIF(BuildContext context) async {
//   GiphyGif? gif;
//   try {
//     gif = await Giphy.getGif(
//       context: context,
//       apiKey: 'pwXu0t7iuNVm8VO5bgND2NzwCpVH9S0F',
//     );
//   } catch (e) {
//     showSnackBar(context: context, content: e.toString());
//   }
//   return gif;
// }
