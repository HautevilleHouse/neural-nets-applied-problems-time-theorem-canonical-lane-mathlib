import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure TrainingTimeGuarantee {C : NeuralNetworkCapacity} {G : GradientDescentConvergence C} where
  targetAccuracy : ℝ
  iterationCountBound : ℕ
  guaranteeHolds : Prop

structure TrainingTimeGuaranteeEvidence {C : NeuralNetworkCapacity} {G : GradientDescentConvergence C} (T : TrainingTimeGuarantee C G) where
  targetAccuracyClosed : T.targetAccuracy ∈ {x : ℝ | 0 < x ∧ x < 1}
  iterationCountBoundClosed : T.iterationCountBound ≥ 1
  guaranteeHoldsClosed : T.guaranteeHolds

def TrainingTimeGuaranteeClosed {C : NeuralNetworkCapacity} {G : GradientDescentConvergence C} (T : TrainingTimeGuarantee C G) : Prop :=
  (0 < T.targetAccuracy ∧ T.targetAccuracy < 1) ∧ T.iterationCountBound ≥ 1 ∧ T.guaranteeHolds

theorem training_time_guarantee_closed_from_evidence {C : NeuralNetworkCapacity} {G : GradientDescentConvergence C} (T : TrainingTimeGuarantee C G) (E : TrainingTimeGuaranteeEvidence T) : TrainingTimeGuaranteeClosed T := by
  exact And.intro E.targetAccuracyClosed (And.intro E.iterationCountBoundClosed E.guaranteeHoldsClosed)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse