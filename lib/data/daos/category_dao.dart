import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../database/objectbox.g.dart';
import '../datasources/local_objectbox_datasource.dart';
import 'package:objectbox/objectbox.dart' as objectbox;

@Injectable(as: CategoryDAOInterface)
class CategoryDAO implements CategoryDAOInterface {
  late final objectbox.Store _store;
  final LocalObjectBoxDataSource dataSource;
  late final Box<CategoryDTO> _categoryBox;

  CategoryDAO({required this.dataSource}) {
    _store = dataSource.store;

    // open box
    _categoryBox = objectbox.Box<CategoryDTO>(_store);
  }

  @override
  Future<int> countAll() async {
    final int catCount = _categoryBox.count();
    //final int catCount = _store.box<CategoryDTO>().count();
    return catCount;
  }

  @override
  Future<Either<String, int>> insert({required CategoryDTO category}) async {
    late int result;

    try {
      result = await _categoryBox.putAsync(category);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> delete(int categoryId) async {
    Query<CategoryDTO> query = _store
        .box<CategoryDTO>()
        .query(CategoryDTO_.id.equals(categoryId))
        .build();
    await query.removeAsync();
    query.close();
  }

  @override
  Future<List<CategoryDTO>> findAll() async {
    Query<CategoryDTO> query =
        _store.box<CategoryDTO>().query().order(CategoryDTO_.id).build();
    List<CategoryDTO> categories = await query.findAsync();
    query.close();
    return categories;
  }

  @override
  Future<List<CategoryDTO>> findOne(int categoryId) async {
    Query<CategoryDTO> query = _store
        .box<CategoryDTO>()
        .query(CategoryDTO_.id.equals(categoryId))
        .build();
    List<CategoryDTO> categories = await query.findAsync();
    query.close();
    return categories;
  }

  @override
  Future<void> deleteAll() async {
    _store.box<CategoryDTO>().removeAllAsync();
  }
}
