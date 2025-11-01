// con el flutter snippet, si utilizo el mateapp me generara el esqueleto de una app
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_apps/src/views/admin_todo_page.dart';
import 'package:todo_apps/src/views/home_page.dart';
import 'package:todo_apps/src/views/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            path: '/todos',
            name: 'todo-list',
            builder: (state, context) => const HomePage(),
            routes: [
              GoRoute(
                path: '/create', //?   /todos/create
                name: 'new-todo',
                builder: (context, state) => AdminTodoPage(),
              ),
              GoRoute(
                path: '/:id', //?   /todos/124
                name: 'update-todo',
                builder: (context, state) {
                  print(state.pathParameters);
                  final todo = state.extra as Map<String, dynamic>;

                  return AdminTodoPage(todo: todo);
                },
              ),
             
            ],
            
          ),
           GoRoute(
                path: '/login',
                name: 'login-page',
                builder: (context, state) {
                   return const LoginPage();
                },
               
              )
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Todo - App',
      // initialRoute: '/',
      // home: AdminTodoPage(), // mi primer widget personalizado
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/admin-todos': (context) => AdminTodoPage(),
      // },
    );
  }
}