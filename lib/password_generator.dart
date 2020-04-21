import 'dart:math';

import 'package:flutter/material.dart';

class PasswordGenerator {
  final int passwordLength;
  final bool isSpaceAllowed;
  final bool isUppercaseAllowed;
  final bool isLowercaseAllowed;
  final bool isNumberAllowed;
  final bool isSymbolAllowed;

  PasswordGenerator({
    @required this.passwordLength,
    @required this.isSpaceAllowed,
    @required this.isUppercaseAllowed,
    @required this.isLowercaseAllowed,
    @required this.isNumberAllowed,
    @required this.isSymbolAllowed,
  });

  String generate(){
    String result = "";
    
    for(int i=1; i<= passwordLength; i++){
      result += String.fromCharCode(_generateAsciiNumber());
    }

    return result;
  }

  int _generateAsciiNumber(){
    int result = Random().nextInt(94) + 32;
    return _validateAsciiNumber(result) ? result : _generateAsciiNumber();
  }

  bool _validateAsciiNumber(int asciiNumber){
    bool result = true;

    if(!isSpaceAllowed && _isSpace(asciiNumber)){
      return false;
    }

    if(!isUppercaseAllowed && _isUppercase(asciiNumber)){
      return false;
    }

    if(!isLowercaseAllowed && _isLowercase(asciiNumber)){
      return false;
    }

    if(!isNumberAllowed && _isNumber(asciiNumber)){
      return false;
    }

    if(!isSymbolAllowed && _isSymbol(asciiNumber)){
      return false;
    }

    return result;
  }

  bool _isSpace(int asciiNumber){
    return (asciiNumber == 32);
  }

  bool _isUppercase(int asciiNumber){
    switch(asciiNumber){
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
        return true;
      
      default:
        return false;
    }
  }

  bool _isLowercase(int asciiNumber){
    switch(asciiNumber){
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
        return true;
      
      default:
        return false;
    }
  }

  bool _isNumber(int asciiNumber){
    switch(asciiNumber){
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
        return true;
      
      default:
        return false;
    }
  }

  bool _isSymbol(int asciiNumber){
    switch(asciiNumber){
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:

      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      
      case 123:
      case 124:
      case 125:
      case 126:
        return true;
      
      default:
        return false;
    }
  }
}