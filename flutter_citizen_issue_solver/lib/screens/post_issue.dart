import 'package:citizen_issue_solver_flutter/widgets/text_field.dart';
import 'package:flutter/material.dart';

class PostIssue extends StatefulWidget {
  const PostIssue({Key? key}) : super(key: key);

  @override
  _PostIssueState createState() => _PostIssueState();
}

class _PostIssueState extends State<PostIssue> {
  var _titleController = TextEditingController();
  var _discriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextBox(label: 'Issue Title', controller: _titleController),
        TextBox(label: 'Description', controller: _discriptionController),

        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.done), label: Text("Post Issue")),


      ],
    );
  }
}
