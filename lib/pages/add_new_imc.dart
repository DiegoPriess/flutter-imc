import 'package:flutter/material.dart';
import 'package:flutter_imc/pages/my_home_page.dart';

class AddNewImc extends StatefulWidget {
  const AddNewImc({super.key, required this.title});

  final String title;

  @override
  State<AddNewImc> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<AddNewImc> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FloatInput(
                  labelText: 'Nome',
                  inputPlaceholder: 'Informe o nome',
                ),
                const FloatInput(
                  labelText: 'Altura',
                  inputPlaceholder: 'Informe a altura',
                ),
                const FloatInput(
                  labelText: 'Peso',
                  inputPlaceholder: 'Informe o peso',
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('IMC adicionado com sucesso')),
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(title: "Calculadora de IMC")),
                    );
                  },
                  child: const Text('Confirmar'),
                ),
              ],
            ),
          ),
        )
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
