// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';

import 'package:cadtest/constants/app_strings.dart';
import 'package:cadtest/model/caption_model.dart';
import 'package:cadtest/model/segmentation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../model/get_url_model.dart';

class GetResultProvider extends ChangeNotifier {
  int? totalLength = 0;
  var responseDecode, headerGet, formDataGet;
  List<GetUrlModel> urlModel = [];
  List<GetCaptionModel> captionString = [];
  List<SegmentationModel> segModel = [];
  bool loader = false;

  //Search categories from the API methods
  void searchGetCatProvider({String? catId, String? queryType}) async {
    captionString.clear();
    segModel.clear();
    urlModel.clear();
    formDataGet = {
      'image_ids[]': catId,
      'querytype': queryType,
    };
    headerGet = {
      "contentType": "application/x-www-form-urlencoded",
      "Origin": "https://cocodataset.org/",
      "Accept-Encoding": "gzip, deflate, br",
    };
    try {
      loader = true;
      notifyListeners();
      final response = await http.post(
          Uri.parse(AppStrings.Api____url____String),
          body: formDataGet,
          headers: headerGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        responseDecode = json.decode(response.body);
        if (responseDecode.length > 15) {
          totalLength = 10;
          notifyListeners();
        } else {
          totalLength = responseDecode.length;
          notifyListeners();
        }
        for (int i = 0; i <= totalLength!; i++) {
          getUrls(responseDecode[i]["id"].toString());
          getCaptions(responseDecode[i]["id"].toString());
          getSegmentation(responseDecode[i]["id"].toString());
        }
        loader = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//get urls for all categories
  void getUrls(String? urlId) async {
    var decodedData;
    formDataGet = {
      'image_ids[]': urlId,
      'querytype': "getImages",
    };
    try {
      loader = true;
      notifyListeners();
      final response = await http.post(
          Uri.parse(AppStrings.Api____url____String),
          body: formDataGet,
          headers: headerGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        decodedData = json.decode(response.body);
        urlModel.add(GetUrlModel(
          id: decodedData[0]['id'].toString(),
          cocoUrl: decodedData[0]['coco_url'].toString(),
          flickerUrl: decodedData[0]['flickr_url'].toString(),
          status: false,
        ));
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //get Captions for all categories
  void getCaptions(String? captionId) async {
    var _decodedData;
    formDataGet = {
      'image_ids[]': captionId,
      'querytype': "getCaptions",
    };
    try {
      loader = true;
      notifyListeners();
      final response = await http.post(
          Uri.parse(AppStrings.Api____url____String),
          body: formDataGet,
          headers: headerGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        _decodedData = json.decode(response.body);
        captionString.add(GetCaptionModel(
            captions: _decodedData[0]['caption'].toString(), status: false));
        loader = false;
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getSegmentation(String segment_id) async {
    final String response =
        await rootBundle.loadString(AppStrings.local__json__String);
    final data = await json.decode(response);
    var decodedData;
    formDataGet = {
      'image_ids[]': segment_id,
      'querytype': "getInstances",
    };
    try {
      loader = true;
      notifyListeners();
      final response = await http.post(
          Uri.parse(AppStrings.Api____url____String),
          body: formDataGet,
          headers: headerGet);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List segemntation = [];
        List segementsAdd = [];
        decodedData = json.decode(response.body);
        for (int i = 0; i <= data['items'].length; i++) {
          if (decodedData[0]['category_id'] == data['items'][i]["id"]) {
            segemntation = jsonDecode(decodedData[0]["segmentation"])[0];

            for (var element in segemntation) {
              segementsAdd.add(element.toString());
            }
            segModel.add(SegmentationModel(
                imageUrl: data['items'][i]["url"],
                imageId: decodedData[0]["image_id"].toString(),
                segmentation: segementsAdd));
            notifyListeners();
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
