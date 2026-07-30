import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure RNNMemoryDynamics where
  hiddenStateDimension : Nat
  timeStepsCount : Nat
  vanishingGradientDetected : Prop
  explodingGradientDetected : Prop
  longTermMemoryRetained : Prop

def RNNMemoryStability (R : RNNMemoryDynamics) : Prop :=
  ¬R.vanishingGradientDetected ∧ ¬R.explodingGradientDetected ∧ R.longTermMemoryRetained

theorem rnn_memory_stable (R : RNNMemoryDynamics) (hVan : ¬R.vanishingGradientDetected) (hExp : ¬R.explodingGradientDetected) (hLong : R.longTermMemoryRetained) :
  RNNMemoryStability R := by
  exact And.intro hVan (And.intro hExp hLong)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
