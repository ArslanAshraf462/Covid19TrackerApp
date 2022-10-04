import 'dart:convert';

import '../Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/world_states_model.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }
}