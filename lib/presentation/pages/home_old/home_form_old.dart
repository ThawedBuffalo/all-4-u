import 'package:flutter/material.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeFormState();
  }
}

class HomeFormState extends State<HomeForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController formController = TextEditingController();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text('Welcome!', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        key: const Key('sign-in-title'),
      ),
      body: SafeArea(
        // child: buildBody(context)));
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: 30),
          Image.asset(
            'assets/images/Sabres.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: formController,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data-> ')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ]),
      ),
    );
  }
}
