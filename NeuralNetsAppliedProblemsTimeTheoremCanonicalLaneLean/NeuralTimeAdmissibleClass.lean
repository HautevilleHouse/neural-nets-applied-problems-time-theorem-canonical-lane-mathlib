import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure NeuralTimeObject where
  network : Type
  depth : Nat
  width : Nat
  trainingSet : List (Vector ℝ (natToFin depth)) × Vector ℝ (natToFin 1)
  lossFunction : Type
  timeHorizon : ℝ
  learningRate : ℝ
  convergencePoint : Prop

structure NeuralTimeAdmissibleObject where
  obj : NeuralTimeObject
  timeHorizonBound : Prop
  convergencePointTerm : convergencePoint
  convergencePoint : convergencePoint


structure AdmissibleClass where
  object : NeuralTimeAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NeuralTimeWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
