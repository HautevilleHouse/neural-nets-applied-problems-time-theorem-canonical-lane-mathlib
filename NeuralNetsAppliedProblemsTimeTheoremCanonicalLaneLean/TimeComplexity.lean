import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure TimeComplexityPackage where
  algorithmName : String
  inputSize : ℕ → ℕ
  timeFunction : ℕ → ℕ
  complexityClass : String
  worstCase : Bool

structure TimeComplexityEvidence (T : TimeComplexityPackage) where
  algorithmDefined : T.algorithmName ≠ ""
  timeFunctionPositive : ∀ n : ℕ, T.timeFunction n > 0
  complexityClassDefined : T.complexityClass = "P" ∨ T.complexityClass = "NP" ∨ T.complexityClass = "EXP"
  worstCaseRecorded : T.worstCase = true

def TimeComplexityClosed (T : TimeComplexityPackage) : Prop :=
  T.algorithmName ≠ "" ∧
  (∀ n : ℕ, T.timeFunction n > 0) ∧
  (T.complexityClass = "P" ∨ T.complexityClass = "NP" ∨ T.complexityClass = "EXP") ∧
  T.worstCase = true

theorem time_complexity_closed_from_evidence
    (T : TimeComplexityPackage) (E : TimeComplexityEvidence T) :
    TimeComplexityClosed T := by
  exact And.intro E.algorithmDefined (And.intro E.timeFunctionPositive
    (And.intro E.complexityClassDefined E.worstCaseRecorded))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse