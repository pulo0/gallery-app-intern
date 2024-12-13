import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallery_app/styles/app_theme.dart';
import 'package:gallery_app/presentation/comment_post/cubit/comment_post_cubit.dart';
import 'package:gallery_app/domain/models/comment.dart';

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

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    final TextTheme textTheme = mainTheme().textTheme;
    final ColorScheme colorScheme = mainTheme().colorScheme;

    final validatorDetails = MultiValidator([
      RequiredValidator(errorText: locale.validFieldRequest),
      MinLengthValidator(6, errorText: locale.validFieldChar)
    ]);

    final validatorEmail = MultiValidator([
      RequiredValidator(errorText: locale.validFieldRequest),
      EmailValidator(errorText: locale.validFieldEmail)
    ]);

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
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
                    validator: validatorDetails.call,
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
                    validator: validatorEmail.call,
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
                    validator: validatorDetails.call,
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
        ),
      ),
    );
  }
}
