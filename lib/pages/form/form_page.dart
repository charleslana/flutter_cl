import 'package:flutter/material.dart';
import 'package:flutter_cl/models/credential.dart';
import 'package:flutter_cl/validations/credential_validator.dart';
import 'package:gap/gap.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final credential = Credential();
  final validator = CredentialValidator();
  final formKey = GlobalKey<FormState>();

  bool isValid() {
    final result = validator.validate(credential);
    return result.isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(12),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validator.byField(credential, 'email'),
                          onChanged: credential.setEmail,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            errorMaxLines: 3,
                          ),
                        ),
                        const Gap(12),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validator.byField(credential, 'password'),
                          onChanged: credential.setPassword,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            errorMaxLines: 3,
                          ),
                        ),
                        const Gap(24),
                        ListenableBuilder(
                            listenable: credential,
                            builder: (context, child) {
                              return ElevatedButton(
                                // onPressed: () {
                                //   formKey.currentState?.validate();
                                //   final result = validator.validate(credential);
                                //   for (final exception in result.exceptions) {
                                //     print(exception.message);
                                //   }
                                // },
                                onPressed: isValid()
                                    ? () {
                                        print(credential);
                                      }
                                    : null,
                                child: const Text('Entrar'),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
