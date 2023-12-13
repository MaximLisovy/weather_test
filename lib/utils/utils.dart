

String checkNegative(String temperature){
  if(temperature[0] == "-"){
    return temperature;
  } else {
    return "+$temperature";
  }
}