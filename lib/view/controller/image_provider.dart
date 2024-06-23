import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:religion_app/view/controller/helper/api_sarvice.dart';
import 'package:share_extend/share_extend.dart';

import '../../utils/global_variable.dart';

class ImagesProvider extends ChangeNotifier{
  Future<void> shareImage()
  async {
    RenderRepaintBoundary? boundray =
    imgKey.currentContext!.findRenderObject()
    as RenderRepaintBoundary;
    ui.Image image = await boundray.toImage();
    ByteData? bytedata = await image.toByteData(
        format: ui.ImageByteFormat.png);
    final imgdata = bytedata!.buffer.asUint8List();
    final directory =
        await getApplicationDocumentsDirectory();
    final fileImage =
        await File('${directory.path}/img.png')
        .create();
    fileImage.writeAsBytesSync(imgdata);
    await ShareExtend.share(fileImage.path, 'dohe');
    notifyListeners();
  }

  Future<void> saveImage()
  async {
    RenderRepaintBoundary? boundray =
    imgKey.currentContext!.findRenderObject()
    as RenderRepaintBoundary;
    ui.Image image = await boundray.toImage();
    ByteData? bytedata = await image.toByteData(
        format: ui.ImageByteFormat.png);
    final imgdata = bytedata!.buffer.asUint8List();
    ImageGallerySaver.saveImage(imgdata,
        name: 'poster', quality: 100);
    notifyListeners();
  }

  void copyText(ApiSarvice apiSarvice,int index,BuildContext context)
  {
    Clipboard.setData(ClipboardData(
        text:
        '${apiSarvice.modalList[index].hindi}   ${apiSarvice.language[index]}'));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text(
        'Copied',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
    notifyListeners();
  }
}