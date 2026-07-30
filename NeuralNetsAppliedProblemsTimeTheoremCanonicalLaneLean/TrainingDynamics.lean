import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure TrainingDynamicsPackage where
  optimizationAlgorithm : String
  learningRateSchedule : Nat → ℝ
  convergenceCriteria : Prop
  timeSteps : Nat
  lossSequence : List ℝ

structure TrainingDynamicsEvidence (T : TrainingDynamicsPackage) where
  algorithmDefined : T.optimizationAlgorithm ≠ ""
  scheduleDefined : ∀ t : Nat, T.learningRateSchedule t > 0
  convergenceReached : T.convergenceCriteria
  lossDecreasing : ∀ i : Nat, i < T.lossSequence.length - 1 → T.lossSequence.get? i > T.lossSequence.get? (i+1)

def TrainingDynamicsClosed (T : TrainingDynamicsPackage) : Prop :=
  T.optimizationAlgorithm ≠ "" ∧
  (∀ t : Nat, T.learningRateSchedule t > 0) ∧
  T.convergenceCriteria ∧
  (∀ i : Nat, i < T.lossSequence.length - 1 → T.lossSequence.get? i > T.lossSequence.get? (i+1))

theorem training_dynamics_closed_from_evidence
    (T : TrainingDynamicsPackage) (E : TrainingDynamicsEvidence T) :
    TrainingDynamicsClosed T := by
  exact And.intro E.algorithmDefined (And.intro E.scheduleDefined
    (And.intro E.convergenceReached E.lossDecreasing))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse