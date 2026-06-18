import 'dart:convert';

import 'package:covid_19_tracker/Model/world_stat_model.dart';
import 'package:covid_19_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldStatModel> getWorldStats() async {
     final response= await http.get(Uri.parse(AppUrl.worldStatsApi));

     if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatModel.fromJson(data);
     } else {
      throw Exception('Failed to load world stats');
     }
    
  }
}
