final databaseProvider = Provider<Future<Database>>((ref) async {
  return openDatabase(
    join(await getDatabasesPath(), 'goals.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE goals(id INTEGER PRIMARY KEY, title TEXT, description TEXT, progress INTEGER)",
      );
    },
    version: 1,
  );
});

final goalsProvider = FutureProvider<List<Goal>>((ref) async {
  final db = await ref.watch(databaseProvider);
  final List<Map<String, dynamic>> maps = await db.query('goals');
  return List.generate(maps.length, (i) => Goal.fromMap(maps[i]));
});
