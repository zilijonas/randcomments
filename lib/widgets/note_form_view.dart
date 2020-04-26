import 'package:flutter/material.dart';
import 'package:randcomments/theme/colors.dart';
import 'package:randcomments/theme/text_styles.dart';
import 'package:randcomments/widgets/large_text_form_field.dart';

import 'action_button.dart';

class NoteFormView extends StatelessWidget {
  final String title;
  final String initialValue;
  final String formFieldError;
  final void Function(String) onEditSaveClicked;
  final void Function() onRemoveClicked;
  final bool editSaveLoading;
  final bool removeLoading;

  NoteFormView(
      {@required this.title,
      @required this.initialValue,
      @required this.formFieldError,
      @required this.onEditSaveClicked,
      this.onRemoveClicked,
      this.editSaveLoading = false,
      this.removeLoading = false});

  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'content': null};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _formTitle(),
          LargeTextFormField(
              formFieldError,
              (val) => _formData['content'] = val,
              initialValue,
              editSaveLoading || removeLoading,
              _loadingMessage()),
          SizedBox(height: 10),
          _formActions(),
          SizedBox(height: 10),
          _returnToPrevPageHint(),
        ],
      ),
    );
  }

  Row _returnToPrevPageHint() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Swipe right to return', style: TextStyles.returnHint),
        Icon(Icons.keyboard_arrow_right, color: ThemeColors.white),
      ],
    );
  }

  Widget _formActions() {
    if (onRemoveClicked == null) {
      return ActionButton(
          icon: Icons.check,
          color: ThemeColors.green,
          onPressed: _handleSubmit,
          disabled: editSaveLoading || removeLoading);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButton(
          icon: Icons.check,
          color: ThemeColors.green,
          onPressed: _handleSubmit,
          disabled: editSaveLoading || removeLoading,
        ),
        SizedBox(width: 40),
        ActionButton(
          icon: Icons.clear,
          color: ThemeColors.red,
          onPressed: onRemoveClicked,
          disabled: editSaveLoading || removeLoading,
        ),
      ],
    );
  }

  Padding _formTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Text(title, style: TextStyles.pageTitle),
    );
  }

  String _loadingMessage() =>
      editSaveLoading ? 'Saving...' : removeLoading ? 'Removing...' : '';

  void _handleSubmit() {
    if (_formKey.currentState.validate()) {
      onEditSaveClicked(_formData['content']);
    }
  }
}
