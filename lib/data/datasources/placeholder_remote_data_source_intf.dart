import '../models/placeholder_model.dart';

abstract class PlaceholderRemoteDataSourceInterface {
  Future<PlaceholderModel> getRemotePlaceholderDataWithParam(
      String placeholderParam);
  Future<PlaceholderModel> getRemotePlaceholderDataWithoutParam();
}
