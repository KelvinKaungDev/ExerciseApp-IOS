import Foundation

struct Exercise {
    let exerciseName : String
    let videoName : String
    
    enum ExerciseEnum: CustomStringConvertible {
      case squat
      case stepUp
      case burpee
      case sunSalute

      var description: String {
        switch self {
        case .squat:
          return NSLocalizedString("Squat", comment: "exercise")
        case .stepUp:
          return NSLocalizedString("Step Up", comment: "exercise")
        case .burpee:
          return NSLocalizedString("Burpee", comment: "exercise")
        case .sunSalute:
          return NSLocalizedString("Sun Salute", comment: "yoga stretch")
        }
      }
    }
    
    static let exercises = [
      Exercise(
          exerciseName: String(describing: Exercise.ExerciseEnum.squat),
        videoName: "ExerciseOne"),
      Exercise(
          exerciseName: String(describing: Exercise.ExerciseEnum.stepUp),
        videoName: "ExerciseTwo"),
      Exercise(
          exerciseName: String(describing: Exercise.ExerciseEnum.burpee),
        videoName: "ExerciseOne"),
      Exercise(
          exerciseName: String(describing: Exercise.ExerciseEnum.sunSalute),
        videoName: "ExerciseTwo")
  ]
}
