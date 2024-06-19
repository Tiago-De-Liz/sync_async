import 'package:flutter/material.dart';
import 'package:sync_async/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

   _success() {
    return  ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          var titulo = todo.title;
          return ListTile(
            leading: Checkbox(value: todo.completed, onChanged: (bool? value) {  },),
            title: Text(titulo!),
          );
        },
      );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tentar Novamente'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator()
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.error: return _error();
      case HomeState.success: return _success();
      case HomeState.loading: return _loading();
      case HomeState.start: return _start();
      default: return _error();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('List Todo\'s'),
        actions: [
          IconButton(onPressed: () {
            controller.start();
          }, icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state, 
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}