import NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean.NeuralTimeAdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure GradientDescentSaddlePoint (A : AdmissibleClass) where
  network : A.object.obj.network
  learningRate : A.object.obj.learningRate
  timeHorizon : A.object.obj.timeHorizon
  convergenceToSaddle : Prop
  timeBoundSatisfied : Prop
  saddlePointStable : Prop

structure GradientDescentSaddleEvidence (A : AdmissibleClass) (G : GradientDescentSaddlePoint A) where
  convergenceToSaddleClosed : G.convergenceToSaddle
  timeBoundSatisfiedClosed : G.timeBoundSatisfied
  saddlePointStableClosed : G.saddlePointStable

def GradientDescentSaddleClosed (A : AdmissibleClass) (G : GradientDescentSaddlePoint A) : Prop :=
  G.convergenceToSaddle ∧ G.timeBoundSatisfied ∧ G.saddlePointStable

theorem gradient_descent_saddle_closed_from_evidence
    (A : AdmissibleClass) (G : GradientDescentSaddlePoint A)
    (E : GradientDescentSaddleEvidence A G) : GradientDescentSaddleClosed A G := by
  exact And.intro E.convergenceToSaddleClosed
    (And.intro E.timeBoundSatisfiedClosed E.saddlePointStableClosed)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
