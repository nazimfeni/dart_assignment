/*Assignment 02 of Module 02
Finding the average grade of a student result from given list
*/
void main() {
  List<int> grades = [85, 92, 78, 65, 88, 72];

  double sum = 0;
  for (int grade in grades) {
    sum += grade;
  }
  double average = sum / grades.length;
  int rounded_avg = average.toInt();
  print("Student's average grade: $average");
  print("Rounded average: $rounded_avg");
  if (rounded_avg >= 70) {
    print("Passed");
  } else {
    print("Failed");
  }
}
