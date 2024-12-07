import 'package:flutter/material.dart';
import 'package:gallery_app/styles/app_theme.dart';

class FormComment extends StatefulWidget {
  const FormComment({super.key});

  @override
  State<StatefulWidget> createState() => _FormCommentState();
}

class _FormCommentState extends State<FormComment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  String? validator({String? value, required String fieldName}) {
    final capFieldName = fieldName[0].toUpperCase().substring(
        1, fieldName.length - 1);
    if (value == null || value.isEmpty) {
      return 'Field $fieldName is required';
    }
    if (value.length <= 5 && (fieldName == 'name' || fieldName == 'body')) {
      return '$capFieldName should be at least 5 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;

    return Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'exemplary name',
                  labelStyle: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                  icon: Icon(Icons.person),
                ),
                style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.secondary, fontWeight: FontWeight.w400),
                controller: _nameController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                    //   Placeholder for more sophisticated validator
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'example123@gmail.com',
                  labelStyle: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                  icon: Icon(Icons.alternate_email),
                ),
                style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.secondary, fontWeight: FontWeight.w400),
                controller: _emailController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email';
                    //   Placeholder for more sophisticated validator
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Body',
                  hintText: 'body of comment',
                  labelStyle: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                  icon: Icon(Icons.abc),
                ),
                style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.secondary, fontWeight: FontWeight.w400),
                controller: _bodyController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the body';
                    //   Placeholder for more sophisticated validator
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0,),
              ElevatedButton(
                onPressed: () {},
                child: Text('Send Comment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
