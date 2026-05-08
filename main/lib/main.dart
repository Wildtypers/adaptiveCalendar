import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseService.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key}); //creating a super key for unique identification on tree

  @override
  State<MyHomePage> createState() => _HomePageState(); //creating state
}

class _HomePageState extends State<MyHomePage>{
  var table = <Tasks>[];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async{
    final task = await Tasks.tasks();
    setState((){
      table = task;
      }
    );
  }

        

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          spacing: 10,
          children: table.asMap().entries.map((entry) {
            final item = entry.value;

            return RowItems(
              buttonText: item.date,
              taskText: item.task,
              onDelete:() async {
                await Tasks.deleteTask(item.id!);
                final updatedData = await Tasks.tasks();
                setState((){
                  table = updatedData;
                });
              },
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await dialogBuilder(context);
          if (result != null) {
            var insert = result;
            await Tasks.insertTask(insert);
            final updatedData = await Tasks.tasks();
            setState(() {
              table = updatedData;
            });
          }
        },
        label: Text("Add"),
        icon: const Icon(
          Icons.add,
        )
      )
    );
  }

  Future<Tasks?> dialogBuilder(BuildContext context){
    final taskcontroller = TextEditingController();
    final dateController = TextEditingController();
    final priorityController = TextEditingController();
    return showDialog<Tasks>(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Enter a Task"),
          content: Column(
            children: [
              TextField(
                controller: taskcontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText:'Example task',
                )
              ),
              TextField(
                controller: dateController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText:'Ex: 03/15/2026'
                )
              ),
              TextField(
                controller: priorityController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText:'Ex: Necessary'
                )
              )
            ],
            ),
          actions: [
            TextButton(
              onPressed: ()
              {
                return Navigator.pop(context);
              },
            child: Text("Cancel")
            ),
            TextButton(
              onPressed: (){
                return Navigator.pop(
                    context, Tasks(
                      task: taskcontroller.text,
                      date: dateController.text,
                      priority: priorityController.text
                    )
                  );
              },
            child: Text("Add")
            )
          ]
        );
      }
    );
  }
}

class DatabaseService {
  static Database? db;

  static Future<Database> get database async{
    if (db != null) return db!;

    db = await openDatabase(
    join(await getDatabasesPath(), 'tasks.db'),
    onCreate: (db, version){
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, date DATE, task TEXT, priority TEXT)',
      );
    },
    version: 1,
  );

  return db!;
  }
}

class Tasks {
  final String task;
  final String date;
  final int? id;
  final String priority;

  Tasks({this.id, required this.date, required this.task, required this.priority});

  Map<String, Object?> toMap() {
    return {'task' : task, 'date' : date};
  }

  static Future<void> insertTask(Tasks task) async{
    final db = await DatabaseService.database;
    
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  static Future<List<Tasks>> tasks() async{
    final db = await DatabaseService.database;

    final List<Map<String, Object?>> taskMaps = await db.query(
      'tasks',
      orderBy: 'SUBSTR(date, 7, 4) ASC, SUBSTR(date, 1, 2) ASC, SUBSTR(date, 4, 2) ASC',
      );

    return [
      for (final map in taskMaps)
        Tasks(
          id: map['id'] as int,
          date: map['date'] as String, 
          task: map['task'] as String,
          priority: map['priority'] as String
        )
    ];
  }

  static Future<void> deleteTask(int id) async{
    final db = await DatabaseService.database;

    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  
}


class RowItems extends StatelessWidget{
  final String buttonText;
  final String taskText;
  final VoidCallback onDelete;

  const RowItems({
    required this.buttonText,
    required this.taskText,
    required this.onDelete,
    super.key
});


  @override
  Widget build(BuildContext context){ 
    return Row(
      spacing: 15,
      children: [
        Column(
          children: [
            SizedBox(
              width: 90,
              height: 40,
              child: 
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onDelete,
                child: Text(buttonText)
              ),
            )
          ]
        ),
        Column(
          children: [
            Text(taskText),
          ]
        ),
      ]
    );
  }
}