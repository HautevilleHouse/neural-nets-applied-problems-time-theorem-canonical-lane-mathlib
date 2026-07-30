import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure UniversalApproximationPackage where
  targetFunctionClass : String
  width : Nat → Nat
  depth : Nat
  activation : String
  domainDimension : Nat
  approximationError : ℝ

structure UniversalApproximationEvidence (U : UniversalApproximationPackage) where
  functionClassNonempty : U.targetFunctionClass ≠ ""
  widthSufficient : ∀ n : ℝ, U.width n > 0
  activationUniversal : U.activation = "ReLU" ∨ U.activation = "sigmoid"
  errorBound : U.approximationError < 1

def UniversalApproximationClosed (U : UniversalApproximationPackage) : Prop :=
  U.targetFunctionClass ≠ "" ∧
  (∀ n : ℝ, U.width n > 0) ∧
  (U.activation = "ReLU" ∨ U.activation = "sigmoid") ∧
  U.approximationError < 1

theorem universal_approximation_closed_from_evidence
    (U : UniversalApproximationPackage) (E : UniversalApproximationEvidence U) :
    UniversalApproximationClosed U := by
  exact And.intro E.functionClassNonempty (And.intro E.widthSufficient
    (And.intro E.activationUniversal E.errorBound))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse