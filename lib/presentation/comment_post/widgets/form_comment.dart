import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/domain/models/comment.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_cubit.dart';

class FormComment extends StatefulWidget {
  const FormComment(this.commentPostCubit, {super.key});

  final CommentPostCubit commentPostCubit;

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

  String? validatorDetails(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length <= 5) {
      return 'Field should be at least 6 characters long';
    }
    return null;
  }

  String? validatorEmail(String? value) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (!emailRegex.hasMatch(value)) {
      return "This field doesn't have a email format";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final double horizontalPadding = 36.0;

    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;

    final keyboardPlacement = MediaQuery.of(context).viewInsets.bottom;

    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                0,
                horizontalPadding,
                keyboardPlacement,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: locale.labelFormTxt('name'),
                      hintText: locale.hintFormTxt('name'),
                      labelStyle: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                      icon: Icon(Icons.person),
                    ),
                    style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.w400),
                    controller: _nameController,
                    validator: validatorDetails,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: locale.labelFormTxt('mail'),
                      hintText: locale.hintFormTxt('mail'),
                      labelStyle: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                      icon: Icon(Icons.alternate_email),
                    ),
                    style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.w400),
                    controller: _emailController,
                    validator: validatorEmail,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: locale.labelFormTxt('body'),
                      hintText: locale.hintFormTxt('body'),
                      labelStyle: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                      icon: Icon(Icons.abc),
                    ),
                    style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.w400),
                    controller: _bodyController,
                    validator: validatorDetails,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final item = Comment(
                        postId: 0,
                        id: 0,
                        name: _nameController.text,
                        email: _emailController.text,
                        body: _bodyController.text,
                      );
                      if (_formKey.currentState!.validate()) {
                        widget.commentPostCubit.postComment(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(locale.successTxt),
                          ),
                        );
                      }
                    },
                    child: Text(locale.sendTxt),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
