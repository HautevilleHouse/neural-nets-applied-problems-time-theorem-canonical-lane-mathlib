import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure ConvergenceRatePackage where
  rateType : Type
  convergenceExponent : ℝ
  exponentialDecayConstant : ℝ
  iterationComplexity : ℕ → ℝ
  asymptoticBound : Prop
  finiteTimeGuarantee : Prop

structure ConvergenceRateEvidence (C : ConvergenceRatePackage) where
  asymptoticBoundClosed : C.asymptoticBound
  finiteTimeGuaranteeClosed : C.finiteTimeGuarantee
  exponentPositivity : C.convergenceExponent > 0

def ConvergenceRateClosed (C : ConvergenceRatePackage) : Prop :=
  C.asymptoticBound ∧ C.finiteTimeGuarantee ∧ C.convergenceExponent > 0

theorem convergence_rate_closed_from_evidence (C : ConvergenceRatePackage)
    (E : ConvergenceRateEvidence C) : ConvergenceRateClosed C := by
  exact And.intro E.asymptoticBoundClosed
    (And.intro E.finiteTimeGuaranteeClosed E.exponentPositivity)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse