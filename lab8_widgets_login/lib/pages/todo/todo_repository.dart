import '../../pages/todo/todo_model.dart';
import '../../repostory/local_repostory.dart';
import '../../repostory/repostory.dart';

// Singleton
class TodoRepository implements Repository<Todo> {
  TodoRepository._init(LocalRepository localRepository)
      : this.localRepo = localRepository;

  static final TodoRepository _todoRepository =
      TodoRepository._init(LocalRepository.instance);

  static TodoRepository get instance => _todoRepository;

  @override
  LocalRepository localRepo;

  @override
  Future<dynamic> insert(Todo item) async {
    final db = await localRepo.db();
    return await db.insert(Todo.tableName, item.toMap());
  }

  @override
  Future<dynamic> update(Todo item) async {
    final db = await localRepo.db();
    return await db.update(Todo.tableName, item.toMap(),
        where: 'id = ?', whereArgs: [item.id]);
  }

  @override
  Future<dynamic> delete(Todo item) async {
    return await localRepo.db().then((db) => db.delete(Todo.tableName,
        where: 'id' + ' = ?', whereArgs: [item.id]));
  }

  @override
  Future<List<Todo>> items() async {
    final db = await localRepo.db();
    var maps = await db.query(Todo.tableName);
    return Todo.fromList(maps);
  }
}
