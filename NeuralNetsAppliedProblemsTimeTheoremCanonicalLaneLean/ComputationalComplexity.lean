import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure ComputationalComplexityPackage where
  forwardPassComplexity : Nat
  backwardPassComplexity : Nat
  memoryFootprint : Nat
  forwardPassComplexityClosed : forwardPassComplexity > 0
  backwardPassComplexityClosed : backwardPassComplexity > 0
  memoryFootprintClosed : memoryFootprint > 0

structure ComputationalComplexityEvidence (C : ComputationalComplexityPackage) where
  forwardPassComplexityClosed : C.forwardPassComplexity > 0
  backwardPassComplexityClosed : C.backwardPassComplexity > 0
  memoryFootprintClosed : C.memoryFootprint > 0

def ComputationalComplexityClosed (C : ComputationalComplexityPackage) : Prop :=
  C.forwardPassComplexity > 0 ∧ C.backwardPassComplexity > 0 ∧ C.memoryFootprint > 0

theorem computational_complexity_closed_from_evidence
    (C : ComputationalComplexityPackage)
    (E : ComputationalComplexityEvidence C) : ComputationalComplexityClosed C :=
  And.intro E.forwardPassComplexityClosed
    (And.intro E.backwardPassComplexityClosed E.memoryFootprintClosed)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse