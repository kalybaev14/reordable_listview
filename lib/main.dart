import 'package:flutter/material.dart';

void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,11,12,13,14,15];
  final controller = TextEditingController();
  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(title: Text('Выберите число'),
      content: TextField(
        controller: controller,
      ),
      actions: [MaterialButton(onPressed: (){},child: Text('Добавить'),elevation: 5,)],);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {createAlertDialog(context);},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ReorderableListView.builder(
            itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(items[index]),
                  onDismissed: (direction) => setState(() {
                    items.removeAt(index);
                  }),
                  child: ListTile(
                   shape:Border.all(width: 2,color: Colors.black) ,
                    key: Key('$index'),
                    title: Text('Item ' '${items[index]}'),
                    onTap: () {},
                    contentPadding: EdgeInsets.all(20),
                    textColor: Colors.black,
                    trailing: Icon(Icons.more_vert),
                    tileColor: Colors.grey.shade300,
                  ),
                ),
            itemCount: items.length,
            onReorder: ((oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final int cat = items.removeAt(oldIndex);
                items.insert(newIndex, cat);
              });
            })),
      ),
    );
  }
}
