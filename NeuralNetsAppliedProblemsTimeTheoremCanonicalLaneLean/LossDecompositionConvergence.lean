import NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean.GradientDescentSaddlePoint

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure LossDecompositionConvergence (A : AdmissibleClass) where
  lossFunction : A.object.obj.lossFunction
  decompositionIntoMonotoneParts : Prop
  convergenceRate : ℝ
  timeHorizon : A.object.obj.timeHorizon
  decompositionProof : Prop
  convergenceProof : Prop

structure LossDecompositionEvidence (A : AdmissibleClass) (L : LossDecompositionConvergence A) where
  decompositionProofClosed : L.decompositionProof
  convergenceProofClosed : L.convergenceProof

def LossDecompositionClosed (A : AdmissibleClass) (L : LossDecompositionConvergence A) : Prop :=
  L.decompositionProof ∧ L.convergenceProof

theorem loss_decomposition_closed_from_evidence
    (A : AdmissibleClass) (L : LossDecompositionConvergence A)
    (E : LossDecompositionEvidence A L) : LossDecompositionClosed A L := by
  exact And.intro E.decompositionProofClosed E.convergenceProofClosed

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
