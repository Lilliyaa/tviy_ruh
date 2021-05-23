import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_apptest/ui/design/round_btn.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'design/sign_datails_screen.dart';

class SignRecognize extends StatefulWidget {
  @override
  _SignRecognizeState createState() => _SignRecognizeState();
}

class _SignRecognizeState extends State<SignRecognize> {
  File pickedImage;
  bool isImageLoaded = false;

  List _result;
  String _confidence = "";
  String _name = "";

  getImageFromCamera(bool isCamera) async {
    var tempStore = await ImagePicker().getImage(
        source: (isCamera == true) ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore.path);
      isImageLoaded = true;
      applyModelOnImage(File(tempStore.path));
    });
  }

  getImageFromGallery(bool isCamera) async {
    var tempStore = await ImagePicker().getImage(
        source: (isCamera == true) ? ImageSource.gallery : ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore.path);
      isImageLoaded = true;
      applyModelOnImage(File(tempStore.path));
    });
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(
        labels: "assets/model/labels.txt",
        model: "assets/model/model_unquant.tflite");

    print("Изображен знак: $resultant");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _result = res;
      String str = _result[0]["label"].substring(2);
      if (res != null && res[0]['confidence'] * 100.0 > 60) {
        _name = str;
        _confidence = _result != null
            ? (_result[0]['confidence'] * 100.0).toString().substring(0, 2) +
                "%"
            : "";
      } else {
        _confidence = "0";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 300,
                    width: 300,
                    child: isImageLoaded
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                image: DecorationImage(
                                    image: FileImage(File(pickedImage.path)),
                                    fit: BoxFit.fill)))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset('assets/images/sign.jpg',
                                fit: BoxFit.fill),
                          )),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 300,
                  child: !isImageLoaded
                      ? Text(
                          "Завантажте фото знаку, щоб розпізнати його",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.italic,
                              shadows: [],
                              fontSize: 20,
                              color: Colors.grey),
                        )
                      : Text(
                          _confidence != "0"
                              ? "Це знак\"$_name\" з вирогідністю $_confidence"
                              : "Не вдалося розпізнати знак",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              shadows: [],
                              fontSize: 20,
                              color: Colors.black),
                        )),
              Visibility(
                  visible: isImageLoaded && _confidence != "0",
                  child: RoundedButton(
                      horPadding: 20,
                      verPadding: 15,
                      width: 200,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      text: "Детальніше",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              if (_name == "Дати дорогу"){
                                return SignDetails(3, _name);
                              } else if (_name =="Пішохідний перехід"){
                                return SignDetails(2, _name);
                              }else  if (_name == "Місце для стоянки"){
                                return SignDetails(1, _name);
                              } else{
                                return SignDetails(-1, _name);
                              }
                        }));
                      }))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0.0,
              onPressed: () {
                getImageFromGallery(true);
              },
              child: Icon(Icons.photo_library_outlined),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0.0,
              onPressed: () {
                getImageFromCamera(true);
              },
              child: Icon(Icons.camera_alt),
            ),
          ],
        ));
  }
}
