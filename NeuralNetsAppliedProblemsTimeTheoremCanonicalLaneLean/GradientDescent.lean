import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure GradientDescentOptimization where
  learningRateSchedule : Type u
  lossLandscapeConvexity : Prop
  convergenceRate : Prop
  iterationCountBound : Prop
  globalMinimumReached : Prop

def GradientDescentConvergence (G : GradientDescentOptimization) : Prop :=
  G.convergenceRate ∧ G.iterationCountBound ∧ G.globalMinimumReached

theorem gradient_descent_converges (G : GradientDescentOptimization) (hConv : G.convergenceRate) (hIter : G.iterationCountBound) (hGlobal : G.globalMinimumReached) :
  GradientDescentConvergence G := by
  exact And.intro hConv (And.intro hIter hGlobal)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
