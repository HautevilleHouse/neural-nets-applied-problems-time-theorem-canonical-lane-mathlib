import NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean.LossDecompositionConvergence

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure OverparametrizationBenign (A : AdmissibleClass) where
  width : A.object.obj.width
  depth : A.object.obj.depth
  overparametrizationRatio : ℝ
  generalizationBound : Prop
  timeHorizon : A.object.obj.timeHorizon
  benignOverparamProof : Prop
  generalizationProof : Prop

structure OverparametrizationEvidence (A : AdmissibleClass) (O : OverparametrizationBenign A) where
  benignOverparamProofClosed : O.benignOverparamProof
  generalizationProofClosed : O.generalizationProof

def OverparametrizationClosed (A : AdmissibleClass) (O : OverparametrizationBenign A) : Prop :=
  O.benignOverparamProof ∧ O.generalizationProof

theorem overparametrization_closed_from_evidence
    (A : AdmissibleClass) (O : OverparametrizationBenign A)
    (E : OverparametrizationEvidence A O) : OverparametrizationClosed A O := by
  exact And.intro E.benignOverparamProofClosed E.generalizationProofClosed

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
