import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/constant.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  
  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(AppSize.baseSpace),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              _buildRegistrationForm(),
              _buildSignInButton(),
              _buildSignUpButton(),
            ],
          ),
        ]
      )
    );
  }
  
  Widget _buildTitle() {
    return Column(
      children: [
        SizedBox(height: 25),
        Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      SystemNavigator.pop();
                    }
                  },
                  child: Icon(Icons.arrow_back, color: AppPalette.dark),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: AppFontFamily.primaryBold
                      )
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Order cuisine never this easy',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
  
  Widget _buildRegistrationForm() {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (text) {
            setState(() {
              isNameValid = text.trim().length > 2;
            });
          },
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Full Name',
            hintText: 'Your full name',
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 5)
          ),
        ),        
        SizedBox(height: 20),
        TextField(
          onChanged: (text) {
            setState(() {
              isEmailValid = EmailValidator.validate(text.trim());
            });
          },
          controller: emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Email Address',
            hintText: 'Your email address',
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 5)
          ),
        ),
        SizedBox(height: 20),
        TextField(
          onChanged: (text) {
            setState(() {
              isPasswordValid = text.length >= 6;
            });
          },
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Password',
            hintText: 'Your password',
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 5)
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: 'Confirm Password',
            hintText: 'Repeat your password',
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 5)
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSignUpButton() {
    bool isFormValid = isNameValid && isEmailValid && isPasswordValid;
    return Center(
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 16, color: AppPalette.white),
        ),
        color: AppPalette.green,
        onPressed: isFormValid ? onSubmit : null
      ),
    );
  }

  onSubmit() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text;
    
  }

  Widget _buildSignInButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Already have an account', 
            style: TextStyle(
              color: AppPalette.darkGrey,
              fontSize: 14
          )
        ),
        GestureDetector(
          child: Text(
            'Sign In', 
            style: TextStyle(
              fontFamily: AppFontFamily.primaryBold,
              fontSize: 14
            )
          ),
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        )
      ],
    );
  }
}