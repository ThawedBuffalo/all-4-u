import 'package:all_4_u/data/datasources/daos/item_dao.dart';
import 'package:floor/floor.dart';
import '../../converters/list_int_converter.dart';
import '../../dtos/category_dto.dart';
import '../../dtos/item_dto.dart';
import '../../dtos/person_dto.dart';
import '../daos/category_dao.dart';
import '../daos/person_dao.dart';

// This is generated by the floor generator
part 'all4u_db.g.dart';

@TypeConverters([ListIntConverter])
@Database(version: 1, entities: [CategoryDTO, ItemDTO, PersonDTO])
abstract class All4UDb extends FloorDatabase {
  CategoryDAO get categoryDAO;
  ItemDAO get itemDAO;
  PersonDAO get personDAO;
}
