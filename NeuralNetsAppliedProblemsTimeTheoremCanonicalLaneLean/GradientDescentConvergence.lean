import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure GradientDescentConvergence {C : NeuralNetworkCapacity} where
  learningRate : ℝ
  lossFunctionConvex : Prop
  gradientLipschitz : ℝ
  iterationCount : ℕ
  convergenceRate : ℝ

structure GradientDescentConvergenceEvidence {C : NeuralNetworkCapacity} (G : GradientDescentConvergence C) where
  learningRateClosed : G.learningRate > 0
  lossFunctionConvexClosed : G.lossFunctionConvex
  gradientLipschitzClosed : G.gradientLipschitz > 0
  iterationCountClosed : G.iterationCount ≥ 1
  convergenceRateClosed : G.convergenceRate = (1 - G.learningRate * G.gradientLipschitz) ^ G.iterationCount

def GradientDescentConvergenceClosed {C : NeuralNetworkCapacity} (G : GradientDescentConvergence C) : Prop :=
  G.learningRate > 0 ∧ G.lossFunctionConvex ∧ G.gradientLipschitz > 0 ∧ G.iterationCount ≥ 1 ∧
  G.convergenceRate = (1 - G.learningRate * G.gradientLipschitz) ^ G.iterationCount

theorem gradient_descent_convergence_closed_from_evidence {C : NeuralNetworkCapacity} (G : GradientDescentConvergence C) (E : GradientDescentConvergenceEvidence G) : GradientDescentConvergenceClosed G := by
  exact And.intro E.learningRateClosed (And.intro E.lossFunctionConvexClosed (And.intro E.gradientLipschitzClosed (And.intro E.iterationCountClosed E.convergenceRateClosed)))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse