class Preparation {
  final String shortDescription;
  final List<Step> steps;

  Preparation({
    required this.shortDescription,
    required this.steps,
  });

  Map<String, dynamic> toMap() {
    return {
      'shortDescription': shortDescription,
      'steps': steps.map((step) => step.toMap()).toList(),
    };
  }

  factory Preparation.fromMap(Map<String, dynamic> map) {
    List<Step> loadedSteps =
        (map['steps'] as List).map((stepMap) => Step.fromMap(stepMap)).toList();

    return Preparation(
      shortDescription: map['shortDescription'],
      steps: loadedSteps,
    );
  }
}

class Step {
  final int stepNumber;
  final String instruction;
  final Duration? duration; 
  final List<String>? tips; // Optional list of tips for this step

  Step({
    required this.stepNumber,
    required this.instruction,
    this.duration,
    this.tips,
  });

  Map<String, dynamic> toMap() {
    return {
      'stepNumber': stepNumber,
      'instruction': instruction,
      'duration': duration?.inSeconds,
      'tips': tips,
    };
  }

  factory Step.fromMap(Map<String, dynamic> map) {
    return Step(
      stepNumber: map['stepNumber'],
      instruction: map['instruction'],
      duration:
          map['duration'] != null ? Duration(seconds: map['duration']) : null,
      tips: map['tips'] != null ? List<String>.from(map['tips']) : null,
    );
  }
}
