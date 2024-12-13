class Konversi {
  double sksMatkul(String grade) {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B':
        return 3.0;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'E':
        return 0.0;
      default:
        return 0.0;
    }
  }

  double gradeToPoint(String grade) {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B':
        return 3.0;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'E':
        return 0.0;
      default:
        return 0.0;
    }
  }

  String indeksPrestrasiSemester(double ipk) {
    if (ipk >= 3.5) {
      return 'Dengan Pujian';
    } else if (ipk >= 3.0) {
      return 'Sangat Memuaskan';
    } else if (ipk >= 2.5) {
      return 'Memuaskan';
    } else {
      return 'Tidak Memuaskan';
    }
  }
}
