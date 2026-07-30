import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure NeuralNetworkPackage where
  layerCount : ℕ
  activationFunctions : List Type
  weightMatrices : List Type
  biasVectors : List Type
  inputDimension : ℕ
  outputDimension : ℕ
  architectureDefined : Prop
  universalApproximationProperty : Prop

structure NeuralNetworkEvidence (N : NeuralNetworkPackage) where
  architectureDefinedClosed : N.architectureDefined
  universalApproximationPropertyClosed : N.universalApproximationProperty
  layerCountPositive : N.layerCount ≥ 1

def NeuralNetworkClosed (N : NeuralNetworkPackage) : Prop :=
  N.architectureDefined ∧ N.universalApproximationProperty ∧ N.layerCount ≥ 1

theorem neural_network_closed_from_evidence (N : NeuralNetworkPackage)
    (E : NeuralNetworkEvidence N) : NeuralNetworkClosed N := by
  exact And.intro E.architectureDefinedClosed
    (And.intro E.universalApproximationPropertyClosed E.layerCountPositive)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse