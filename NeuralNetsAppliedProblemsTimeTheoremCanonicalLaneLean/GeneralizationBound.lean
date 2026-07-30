import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure GeneralizationBound {C : NeuralNetworkCapacity} where
  sampleSize : ℕ
  empiricalRisk : ℝ
  trueRisk : ℝ
  confidenceLevel : ℝ
  boundValue : ℝ

structure GeneralizationBoundEvidence {C : NeuralNetworkCapacity} (G : GeneralizationBound C) where
  sampleSizeClosed : G.sampleSize ≥ 1
  empiricalRiskClosed : G.empiricalRisk ≥ 0
  trueRiskClosed : G.trueRisk ≥ 0
  confidenceLevelClosed : G.confidenceLevel ∈ {x : ℝ | 0 < x ∧ x < 1}
  boundValueClosed : G.boundValue = (1 / √(G.sampleSize : ℝ)) * (C.vcDimension : ℝ) + √( (1 / (2 * (G.sampleSize : ℝ))) * Real.log (4 / G.confidenceLevel) )

def GeneralizationBoundClosed {C : NeuralNetworkCapacity} (G : GeneralizationBound C) : Prop :=
  G.sampleSize ≥ 1 ∧ G.empiricalRisk ≥ 0 ∧ G.trueRisk ≥ 0 ∧ (0 < G.confidenceLevel ∧ G.confidenceLevel < 1) ∧
  G.boundValue = (1 / √(G.sampleSize : ℝ)) * (C.vcDimension : ℝ) + √( (1 / (2 * (G.sampleSize : ℝ))) * Real.log (4 / G.confidenceLevel) )

theorem generalization_bound_closed_from_evidence {C : NeuralNetworkCapacity} (G : GeneralizationBound C) (E : GeneralizationBoundEvidence G) : GeneralizationBoundClosed G := by
  exact And.intro E.sampleSizeClosed (And.intro E.empiricalRiskClosed (And.intro E.trueRiskClosed (And.intro E.confidenceLevelClosed E.boundValueClosed)))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse