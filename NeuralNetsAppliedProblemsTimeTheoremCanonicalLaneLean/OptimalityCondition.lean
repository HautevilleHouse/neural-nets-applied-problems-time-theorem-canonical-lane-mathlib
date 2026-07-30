import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure OptimalityConditionPackage where
  stationaryPointSet : Type
  gradientNormCondition : ℝ → Prop
  secondOrderCondition : Prop
  globalOptimumCharacterization : Prop
  localOptimumCondition : Prop

structure OptimalityConditionEvidence (O : OptimalityConditionPackage) where
  gradientNormConditionClosed : ∀ ε > 0, O.gradientNormCondition ε
  secondOrderConditionClosed : O.secondOrderCondition
  globalOptimumCharacterizationClosed : O.globalOptimumCharacterization
  localOptimumConditionClosed : O.localOptimumCondition

def OptimalityConditionClosed (O : OptimalityConditionPackage) : Prop :=
  (∀ ε > 0, O.gradientNormCondition ε) ∧ O.secondOrderCondition ∧
  O.globalOptimumCharacterization ∧ O.localOptimumCondition

theorem optimality_condition_closed_from_evidence (O : OptimalityConditionPackage)
    (E : OptimalityConditionEvidence O) : OptimalityConditionClosed O := by
  exact And.intro E.gradientNormConditionClosed
    (And.intro E.secondOrderConditionClosed
      (And.intro E.globalOptimumCharacterizationClosed E.localOptimumConditionClosed))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse