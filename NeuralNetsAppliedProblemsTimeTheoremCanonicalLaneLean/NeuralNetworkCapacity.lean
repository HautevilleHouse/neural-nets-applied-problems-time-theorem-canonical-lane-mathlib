import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure NeuralNetworkCapacity where
  architectureDepth : Nat
  layerWidths : List Nat
  activationFunction : String
  parameterCount : Nat
  vcDimension : Nat

structure NeuralNetworkCapacityEvidence (C : NeuralNetworkCapacity) where
  architectureDepthClosed : C.architectureDepth > 0
  layerWidthsClosed : ∀ w ∈ C.layerWidths, w > 0
  activationFunctionClosed : C.activationFunction ∈ ["ReLU", "sigmoid", "tanh"]
  parameterCountClosed : C.parameterCount = ∑ w in C.layerWidths, w * (if w = C.layerWidths.head? then 0 else 1)
  vcDimensionClosed : C.vcDimension = C.parameterCount + 1

def NeuralNetworkCapacityClosed (C : NeuralNetworkCapacity) : Prop :=
  C.architectureDepth > 0 ∧ (∀ w ∈ C.layerWidths, w > 0) ∧ C.activationFunction ∈ ["ReLU", "sigmoid", "tanh"] ∧
  C.parameterCount = ∑ w in C.layerWidths, w * (if w = C.layerWidths.head? then 0 else 1) ∧ C.vcDimension = C.parameterCount + 1

theorem neural_network_capacity_closed_from_evidence (C : NeuralNetworkCapacity) (E : NeuralNetworkCapacityEvidence C) : NeuralNetworkCapacityClosed C := by
  exact And.intro E.architectureDepthClosed (And.intro E.layerWidthsClosed (And.intro E.activationFunctionClosed (And.intro E.parameterCountClosed E.vcDimensionClosed)))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse