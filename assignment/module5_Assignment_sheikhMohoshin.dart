abstract class Vehicle {
  late int _speed;

  void move();

  // setter method
  set setSpeed(int speed)=> (_speed = speed);

}

class Car extends Vehicle {
  @override
  void move() {
    print("The car is moving at $_speed km/h");
  }
}

void main() {
  Car car1 = Car();
  car1.setSpeed = 60;
  car1.move();
}