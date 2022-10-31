import 'package:get/get.dart';
import 'dart:math';
import 'package:bmi_getx/utils/constant.dart';

class BMIController extends GetxController {
  var selectedGender = Gender.none.obs;
  var age = 26.obs;
  var selectedWeightIndex = 0.obs;
  var selectedHeightIndex = 0.obs;
  int _weight = 0;
  int _height = 0;
  double bmi = 0.0;
  var result = ''.obs;
  var description = ''.obs;

  void getSelectedHeightIndex(int index, int height) {
    selectedHeightIndex.value = index;
    _height = height;
  }

  void getSelectedWeightIndex(int index, int weight) {
    selectedWeightIndex.value = index;
    _weight = weight;
  }

  void selectGender(Gender gender) {
    selectedGender.value = gender;
  }

  void increaseAge() => age++;
  void decreaseAge() {
    if (age.value > 0) {
      age--;
    }
  }

  //calculator
  void calculatorBMI() {
    if (_height != 0 && _weight != 0 && selectedGender.value != Gender.none) {
      bmi = _weight / pow(_height / 100, 2);
      _getResult();
    } else if (selectedGender.value == Gender.none) {
      Get.snackbar('Gender', 'Hãy chọn giới tính!');
    } else if (_height == 0) {
      Get.snackbar('Height', 'Chiều cao đang là 0, hãy chọn lại chiều cao!');
    } else if (_weight == 0) {
      Get.snackbar('Weight', 'Cân nặng đang là 0, hãy chọn lại cân nặng!');
    }
  }

  //result
  void _getResult() {
    if (bmi < 18.5) {
      result.value = 'Underweight';
    } else if (bmi > 18.5 && bmi < 24.9) {
      result.value = 'Healthy Weight';
    } else if (bmi > 25.0 && bmi < 29.9) {
      result.value = 'Overweight';
    } else {
      result.value = 'Obesity';
    }
    _getDescription();
  }

  //get description
  void _getDescription() {
    if (bmi < 18.5) {
      description.value = "You're in the underweight range. "
          "Eating at least 5 portions of a variety of fruit and vegetables every day. Basing meals on potatoes, bread, rice, pasta or other starchy carbohydrates. Having some dairy or dairy alternatives (such as soya drinks and yoghurts). Eating some beans, pulses, fish, eggs, meat and other protein.";
    } else if (bmi > 18.5 && bmi < 24.9) {
      description.value = "A BMI of 18.5 - 24.9 "
          "indicates that you are at healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.";
    } else if (bmi > 25.0 && bmi < 29.9) {
      description.value =
          'Common treatments for overweight include losing weight through healthy eating,being more physically active, and making other changes to your usual habits. Weight-management programs may help some people lose weight or keep from regaining lost weight.';
    } else {
      description.value =
          "A BMI above 30 indicates that a person is morbidly obese and therefore a candidate for barbaric surgery. Barbaric surgery may also be an option for people with a BMI between 35 and 40 who suffer from life-threatening cardiopulmonary problems, diabetes, or other medical problems listed below.";
    }
  }
}
