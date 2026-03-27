// import 'dart:math';

// /// Helper class for generating UUIDs
// class UuidHelper {
//   static final Random _random = Random();

//   /// Generate a UUID v4 (random UUID)
//   /// Format: xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx
//   /// where x is any hexadecimal digit and y is one of 8, 9, A, or B
//   static String generateUuid() {
//     // Generate 32 hex digits
//     final hexDigits = '0123456789abcdef';
    
//     // Generate random hex string
//     String generateHex(int length) {
//       return List.generate(
//         length,
//         (_) => hexDigits[_random.nextInt(hexDigits.length)],
//       ).join();
//     }

//     // UUID v4 format: 8-4-4-4-12
//     final part1 = generateHex(8);
//     final part2 = generateHex(4);
//     final part3 = '4${generateHex(3)}'; // Version 4
//     final part4 = '${'89ab'[_random.nextInt(4)]}${generateHex(3)}'; // Variant
//     final part5 = generateHex(12);

//     return '$part1-$part2-$part3-$part4-$part5';
//   }

//   /// Validate if a string is a valid UUID format
//   /// Checks for format: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
//   static bool isValidUuid(String? value) {
//     if (value == null || value.isEmpty) {
//       return false;
//     }
    
//     // UUID regex pattern: 8-4-4-4-12 hex digits
//     final uuidPattern = RegExp(
//       r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
//       caseSensitive: false,
//     );
    
//     return uuidPattern.hasMatch(value);
//   }
// }

