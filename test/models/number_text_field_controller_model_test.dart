import 'package:flutter_test/flutter_test.dart';
import 'package:lifttracker/feature/widgets/custom_number_editor/number_text_field_model.dart';

void main() {
  group('Number Text Field Controller Model General Test', () {
    late NumberTextFieldControllerModel model;

    setUp(() {
      model = NumberTextFieldControllerModel(
        startValue: 2,
        incrementAmount: 1,
        decrementAmount: 1,
        minValue: 1,
        canBeFraction: true,
      );
    });

    test('Model value incrementation function', () {
      model.increment();

      expect(model.currentValue, 3);
    });

    test('Model value decrementation function', () {
      model.decrement();

      expect(model.currentValue, 1);
    });

    test("Model value can't be lower than minimum value with decrement method",
        () {
      model
        ..decrement()
        ..decrement()
        ..decrement();

      expect(model.currentValue, model.minValue);
    });

    test("Model value can't be lower than minimum value with setter", () {
      model.currentValue = 0;

      expect(model.currentValue, model.minValue);
    });
  });

  group('Number Text Field Controller Model non fraction Test', () {
    late NumberTextFieldControllerModel model;

    setUp(() {
      model = NumberTextFieldControllerModel(
        startValue: 2,
        incrementAmount: 1,
        decrementAmount: 1,
      );
    });

    test("Value String getter shouldn't return a fraction value", () {
      expect(model.currentValueStringFixed, '2');
    });
  });
}
