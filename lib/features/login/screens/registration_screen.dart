import 'package:flutter/material.dart';
import 'package:flutter_assignments/features/login/constants.dart';
import 'package:flutter_assignments/features/login/screens/social_login_screen.dart';
import 'package:flutter_assignments/features/login/widgets/login_button.dart';
import 'package:flutter_assignments/features/login/widgets/login_page_background.dart';
import 'package:flutter_assignments/features/login/widgets/login_text_field.dart';
import 'package:flutter_assignments/features/login/widgets/password_text_field.dart';
import 'package:flutter_assignments/features/login/widgets/phone_number_text_field.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }

final formatter = DateFormat.yMEd();

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime? _selectedDate;
  Gender _selectedGender = Gender.male;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _cityController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _collageController = TextEditingController();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 50, now.month, now.day);
    final lastDate = now;
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void validateAndSubmitDetails() {
    final bool emailValid = emailRegex.hasMatch(_emailController.text);
    if (!emailValid) {
      _showMessage('Enter valid email!');
      return;
    }

    if (_cityController.text.isEmpty) {
      _showMessage('Enter valid City Name!');
      return;
    }

    if (_mobileNumberController.text.isEmpty ||
        _mobileNumberController.text.length < 10) {
      _showMessage('Enter valid Phone number!');
      return;
    }

    if (_collageController.text.isEmpty) {
      _showMessage('Enter valid Collage Name!');
      return;
    }

    if (_passwordController.text.isEmpty ||
        _passwordController.text.length < 6) {
      _showMessage('Enter valid Password!');
      return;
    }

    if (_confirmPasswordController.text.isEmpty ||
        (_passwordController.text != _confirmPasswordController.text)) {
      _showMessage('Entered passwords doesn\'t match');
      return;
    }

    if (_selectedDate == null) {
      _showMessage('Select date of birth!');
      return;
    }

    _showMessage('Registered successfully');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBackground(
        childWidget: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Join Mr Bookworm!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                LoginTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                  textEditingController: _emailController,
                ),
                LoginTextField(
                  hintText: 'City',
                  icon: Icons.home,
                  textEditingController: _cityController,
                ),
                PhoneNumberTextField(
                  textEditingController: _mobileNumberController,
                ),
                LoginTextField(
                  hintText: 'Collage',
                  icon: Icons.school,
                  textEditingController: _collageController,
                ),
                PasswordTextField(
                  hintText: 'Password',
                  textEditingController: _passwordController,
                ),
                PasswordTextField(
                  hintText: 'Confirm Password',
                  textEditingController: _confirmPasswordController,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Row(
                    children: [
                      DropdownButton(
                        value: _selectedGender,
                        items: Gender.values
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Row(
                                  children: [
                                    Icon(
                                      (gender == Gender.male)
                                          ? Icons.male
                                          : Icons.female,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      gender.name.toUpperCase(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ).toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                        dropdownColor: Colors.black87,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white, // <-- SEE HERE
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: _presentDatePicker,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  (_selectedDate == null)
                                      ? 'Select DOB'
                                      : formatter.format(_selectedDate!),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                LoginButton(
                  buttonText: 'Register',
                  backgroundColor: Colors.white,
                  onButtonClick: validateAndSubmitDetails,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Don\'t have an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const SocialLoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
