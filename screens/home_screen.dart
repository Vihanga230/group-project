class GoalListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsyncValue = ref.watch(goalsProvider);
    return Scaffold(
      appBar: AppBar(title: Text('EduPath Goals')),
      body: goalsAsyncValue.when(
        data: (goals) => ListView.builder(
          itemCount: goals.length,
          itemBuilder: (context, index) {
            final goal = goals[index];
            return ListTile(
              title: Text(goal.title),
              subtitle: Text(goal.description),
              trailing: Text('${goal.progress}%'),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}