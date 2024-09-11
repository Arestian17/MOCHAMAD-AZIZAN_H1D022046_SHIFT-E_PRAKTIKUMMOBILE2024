import 'dart:async';
import 'dart:math';


class LimitCalculator {
  double Function(double) function;

  LimitCalculator(this.function);

  
  double calculateLimit(double c, double epsilon) {
    try {
      if (epsilon <= 0) {
        throw Exception("Epsilon harus lebih besar dari 0.");
      }

     
      double f1 = function(c - epsilon); 
      double f2 = function(c + epsilon); 

      return (f1 + f2) / 2;
    } catch (e) {
      print("Terjadi kesalahan: ${e.toString()}");
      return double.nan; 
    }
  }

 
  Future<double> calculateLimitAsync(double c, double epsilon) async {
    return await Future.delayed(Duration(seconds: 2), () {
      return calculateLimit(c, epsilon);
    });
  }
}

void main() async {
  
  double function(double x) {
    if (x == 1) {
      
      return 2.0; 
    }
    return (pow(x, 2) - 1) / (x - 1);
  }

  
  var calculator = LimitCalculator(function);

  
  double c = 1;
  double epsilon = 0.0001;

  
  print("Menghitung limit secara asynchronous...");
  double result = await calculator.calculateLimitAsync(c, epsilon);
  print("Hasil limit: $result");

 
  if (result.isFinite) {
    print("Perhitungan limit berhasil!");
  } else {
    print("Perhitungan limit gagal.");
  }
}
