
import '../../../../shared.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';


class Validator{

  static FormFieldValidator<String> emailValidator({String errorMessage}){

    return (text){
      bool emailValid = GetUtils.isEmail(text);
      // bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)").hasMatch(text);

      if(!emailValid)
      {
        errorMessage = errorMessage == null ? "This field must be in email formated" : errorMessage;
        return errorMessage;
      }
      return null;
    };

  }

  static FormFieldValidator<String> numberOnlyValidator({String errorMessage}){

    return (text){
      bool isValid = RegExp(r"^[0-9]*$").hasMatch(text);
      if(!isValid)
      {
        errorMessage = errorMessage == null ? "This field only accept numeric character" : errorMessage;
        return errorMessage;
      }
      return null;
    };

  }

  static FormFieldValidator<String> numberPhoneValidator({String errorMessage, int minLength, maxLength,String minLengthMessage}){

    return (text){
//      bool isValid = RegExp(r"^[1-9]*$").hasMatch(text);
      bool isValid = GetUtils.isNum(text);

      if(!isValid)
      {
        errorMessage = errorMessage == null ? "Phone number not valid (E.g: 8xxxxxxxxxx)" : errorMessage;
        return errorMessage;
      }
      else if(minLength!= null && text.length < minLength)
      {
        minLengthMessage = minLengthMessage == null ? "This field too short (min length is $minLength digit)" : minLengthMessage;
        return minLengthMessage;
      }
      if(minLength!= null && text.length > maxLength)
      {
        minLengthMessage = minLengthMessage == null ? "This field too short (max length is $minLength digit)" : minLengthMessage;
        return minLengthMessage;
      }
      return null;
    };

  }

  static FormFieldValidator<String> textOnlyValidator({String errorMessage}){

    return (text){
      bool isValid = RegExp(r"^[a-zA-Z.]+").hasMatch(text);
      if(!isValid)
      {
        errorMessage = errorMessage == null ? "This field only accept text character" : errorMessage;
        return errorMessage;
      }
      return null;
    };

  }

  static FormFieldValidator<String> passwordValidator({int minLength,String minLengthMessage,bool isUniques  =  false, String uniqueMessage}){

    return (text){
      if(minLength!= null && text.length < minLength)
      {
        minLengthMessage = minLengthMessage == null ? "This field is too short (min text length is $minLength)" : minLengthMessage;
        return minLengthMessage;
      }
      else if(isUniques){
        var mediumRegex = new RegExp("^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#%\$&*~^<>()]).{6,}");
//             var mediumRegex = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])(?=.*?[!@#\$&*~])))");
        bool isTextUnique = mediumRegex.hasMatch(text);

        if(!isTextUnique){
          uniqueMessage = uniqueMessage == null ? "Too weak, add special characters and numbers" : uniqueMessage;
        }

        return uniqueMessage;
      }
      return null;
    };

  }


  static FormFieldValidator<String> matchingTextValidator(TextEditingController otherField,{String errorMessage}){

    return (text){
      if(otherField.text != text){
        errorMessage = errorMessage == null ? "This field is not match" : errorMessage;
        return errorMessage;
      }
      return null;
    };

  }

  static FormFieldValidator<String> birthdayValidator(String dateFormat,{String errorMessage}){
    return (text){

      DateFormat formater = DateFormat(dateFormat);
      DateTime initial;
      try {
        initial = formater.parse(text);

//           if(initial.compareTo(DateTime.now()) > 0){
        if(initial.year > DateTime.now().year - 17){
          print('datetime : ${initial.year}');
          errorMessage = errorMessage == null ? "This field must be 17 years lower than today" : errorMessage;
//               errorMessage = errorMessage == null ? "This field must be lesser than today" : errorMessage;
          return errorMessage;
        }

      } catch (error) {}

      return null;
    };
  }

  static FormFieldValidator<String> greaterThanTodayValidator(String dateFormat,{String errorMessage}){

    return (text){
      DateFormat formater = DateFormat(dateFormat);
      DateTime initial;
      try {
        initial = formater.parse(text);

        if(initial.compareTo(DateTime.now()) < 0){
          errorMessage = errorMessage == null ? "This field must be greater than today" : errorMessage;
          return errorMessage;
        }

      } catch (error) {}

      return null;
    };
    
  }

}