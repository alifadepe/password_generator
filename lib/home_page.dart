import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/constant.dart';
import 'package:password_generator/custom_checkbox.dart';
import 'package:password_generator/custom_container.dart';
import 'package:password_generator/password_generator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int passwordLength;
  bool isSpaceAllowed;
  bool isUppercaseAllowed;
  bool isLowercaseAllowed;
  bool isNumberAllowed;
  bool isSymbolAllowed;
  String password;

  @override
  void initState() {
    super.initState();
    passwordLength = 0;
    isSpaceAllowed = true;
    isUppercaseAllowed = true;
    isLowercaseAllowed = true;
    isNumberAllowed = true;
    isSymbolAllowed = true;
    password = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.APP_NAME),
      ),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext context){
            return Center(
              child: Column(
                children: <Widget>[
                  _buildSettingSection(),
                  _buildResultSection(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSettingSection(){
    return CustomContainer(
      title: "Setting",
      child: Column(
        children: <Widget>[
          _buildCheckBox(),
          _buildPasswordLengthInput(),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildCheckBox(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomCheckbox(
              isChecked: isSpaceAllowed,
              onChanged: (bool isChecked){
                setState(() {
                  isSpaceAllowed = isChecked;
                });
              },
              text: "Space",
            ),
            CustomCheckbox(
              isChecked: isUppercaseAllowed,
              onChanged: (bool isChecked){
                setState(() {
                  isUppercaseAllowed = isChecked;
                });
              },
              text: "Uppercase",
            ),
            CustomCheckbox(
              isChecked: isLowercaseAllowed,
              onChanged: (bool isChecked){
                setState(() {
                  isLowercaseAllowed = isChecked;
                });
              },
              text: "Lowercase",
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomCheckbox(
              isChecked: isNumberAllowed,
              onChanged: (bool isChecked){
                setState(() {
                  isNumberAllowed = isChecked;
                });
              },
              text: "Number",
            ),
            CustomCheckbox(
              isChecked: isSymbolAllowed,
              onChanged: (bool isChecked){
                setState(() {
                  isSymbolAllowed = isChecked;
                });
              },
              text: "Symbol",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordLengthInput() {
    return TextField(
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: "Password length",
        hintText: "Password length"
      ),
      onSubmitted: (String text){
        try{
          setState(() {
            passwordLength = int.parse(text);
          });
        }
        catch(e){
          setState(() {
            passwordLength = 0;
          });
        }
      },
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3)
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: MaterialButton(
        child: Text("GENERATE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        color: Theme.of(context).primaryColor,
        onPressed: _generatePassword,
      ),
    );
  }

  Widget _buildResultSection(BuildContext context){
    return CustomContainer(
      title: "Result",
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Text(password,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          Container(
            width: 50,
            height: 50,
            child: MaterialButton(
              child: Icon(Icons.content_copy, size: 20,),
              onPressed: () {
                _copyToClipboard(context);
              },
            ),
          )
        ],
      ),
    );
  }

  void _generatePassword(){
    setState(() {
      password = PasswordGenerator(
        isLowercaseAllowed: isLowercaseAllowed,
        isNumberAllowed: isNumberAllowed,
        isSpaceAllowed: isSpaceAllowed,
        isSymbolAllowed: isSymbolAllowed,
        isUppercaseAllowed: isUppercaseAllowed,
        passwordLength: passwordLength,
      ).generate();
    });
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(
      text: password,
    ));
    
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Password copied to clipboard!"),
    ));
  }
}