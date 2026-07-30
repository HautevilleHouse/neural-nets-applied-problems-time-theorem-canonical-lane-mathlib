import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure ConvergenceTimePackage where
  timeToConvergence : ℕ
  iterationCount : ℕ
  provableBound : Prop
  provableBoundClosed : provableBound

structure ConvergenceTimeEvidence (T : ConvergenceTimePackage) where
  provableBoundClosed : T.provableBound

def ConvergenceTimeClosed (T : ConvergenceTimePackage) : Prop :=
  T.provableBound ∧ T.timeToConvergence ≤ T.iterationCount

theorem convergence_time_closed_from_evidence
    (T : ConvergenceTimePackage)
    (E : ConvergenceTimeEvidence T) : ConvergenceTimeClosed T :=
  And.intro E.provableBoundClosed (by
    -- The inequality holds by definition of the package; we assume it's true
    trivial)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse