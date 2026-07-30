import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure TimeComplexityPackage where
  problemDimension : ℕ
  algorithmType : String
  worstCaseComplexity : ℕ → ℕ
  averageCaseComplexity : ℕ → ℕ
  lowerBound : ℕ → ℕ
  upperBound : ℕ → ℕ
  complexityClass : Prop

structure TimeComplexityEvidence (T : TimeComplexityPackage) where
  worstCaseClosed : ∀ n, T.worstCaseComplexity n ≤ T.upperBound n
  averageCaseClosed : ∀ n, T.averageCaseComplexity n ≤ T.upperBound n
  lowerBoundClosed : ∀ n, T.lowerBound n ≤ T.worstCaseComplexity n
  complexityClassClosed : T.complexityClass

def TimeComplexityClosed (T : TimeComplexityPackage) : Prop :=
  (∀ n, T.worstCaseComplexity n ≤ T.upperBound n) ∧
  (∀ n, T.averageCaseComplexity n ≤ T.upperBound n) ∧
  (∀ n, T.lowerBound n ≤ T.worstCaseComplexity n) ∧
  T.complexityClass

theorem time_complexity_closed_from_evidence (T : TimeComplexityPackage)
    (E : TimeComplexityEvidence T) : TimeComplexityClosed T := by
  exact And.intro E.worstCaseClosed
    (And.intro E.averageCaseClosed
      (And.intro E.lowerBoundClosed E.complexityClassClosed))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse