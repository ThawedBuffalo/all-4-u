import 'dart:convert';

// app specific imports
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/data/datasources/placeholder_remote_data_source_intf.dart';
import 'package:flutter_template/data/models/placeholder_model.dart';
import 'package:http/http.dart' as http;

import '../../core/logging/custom_logger.dart';

// TODO- ensure to change to https once webservice is updated
const PLACEHOLDER_API = 'http://api.palceholder.com:4000/api/v1/whatevers';

class PlaceholderRemoteDataSource
    implements PlaceholderRemoteDataSourceInterface {
  final http.Client client;

  PlaceholderRemoteDataSource({required this.client});

  @override
  Future<PlaceholderModel> getRemotePlaceholderDataWithParam(
      String placeholderParam) async {
    Map data = {'placeholderParam': placeholderParam};

    var bodyData = jsonEncode(data);

    try {
      final response = await client.post(Uri.parse(PLACEHOLDER_API),
          headers: {'Content-Type': 'application/json'}, body: bodyData);

      if (response.statusCode == 200) {
        return PlaceholderModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 101) {
        CustomLogger.loggerNoStack.e('server exception thrown: ' +
            response.statusCode.toString() +
            ' body: ' +
            response.body);
        throw PlaceholderException();
      } else {
        CustomLogger.loggerNoStack.e('server exception thrown: ' +
            response.statusCode.toString() +
            ' body: ' +
            response.body);
        throw PlaceholderException();
      }
    } catch (e) {
      CustomLogger.loggerNoStack.e('server exception thrown: ' + e.toString());
      throw PlaceholderException();
    }
  }

  @override
  Future<PlaceholderModel> getRemotePlaceholderDataWithoutParam() {
    // TODO: implement getRemotePlaceholderDataWithoutParam
    throw UnimplementedError();
  }
}
