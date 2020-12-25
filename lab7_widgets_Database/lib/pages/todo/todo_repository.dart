import '../../repository/local_repository.dart';

import '../../repository/repository.dart';
import 'todo_model.dart';

/// Singleton
class TodoRepository implements Repository<Todo> {
  TodoRepository._init(LocalRepository localRepository) {
    this.localRepo = localRepository;
  }

  static final TodoRepository _todoRepository =
      TodoRepository._init(LocalRepository.instance);

  static TodoRepository get instance => _todoRepository;

  @override
  LocalRepository localRepo;

  @override
  Future delete(Todo item) async {
    return await localRepo.db().then((db) =>
        db.delete(Todo.tableName, where: 'id' + ' = ?', whereArgs: [item.id]));
  }

  @override
  Future insert(Todo item) async {
    final db = await localRepo.db();
    return await db.insert(Todo.tableName, item.toMap());
  }

  @override
  Future<List<Todo>> items() async {
    final db = await localRepo.db();
    var maps = await db.query(Todo.tableName);
    return Todo.fromList(maps);
  }

  @override
  Future update(Todo item) async {
    final db = await localRepo.db();
    return await db.update(Todo.tableName, item.toMap(),
        where: 'id = ?', whereArgs: [item.id]);
  }
}
