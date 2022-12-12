import 'package:flutter/material.dart';
import 'package:flutter_imc/pages/my_home_page.dart';

class AddNewImc extends StatelessWidget {
  const AddNewImc({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('IMC adicionado com sucesso')),
                  );
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: "Calculadora de IMC")),
                );
              },
              child: const Text('Confirmar'),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatInput extends StatelessWidget {
  const FloatInput(
      {super.key, required this.labelText, required this.inputPlaceholder});

  final String labelText;
  final String inputPlaceholder;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(25.0),
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).errorColor
                  : Colors.black;
              return TextStyle(color: color, letterSpacing: 1.3);
            }),
          ),
          //validator: (String? value) {
          //  if (value == null || value == '') {
          //    return inputPlaceholder;
          //  }
          //  return null;
          //},
          autovalidateMode: AutovalidateMode.always,
        ));
  }
}
