import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_repository_intf.dart';
import '../datasources/database/all4u_database.dart';
import '../mapper/item_entity_mapper.dart';
import '../models/item_model.dart';

@Injectable(as: ItemRepositoryInterface)
class ItemRepository implements ItemRepositoryInterface {
  final ItemDAOInterface itemDAO;

  const ItemRepository({required this.itemDAO});
}
