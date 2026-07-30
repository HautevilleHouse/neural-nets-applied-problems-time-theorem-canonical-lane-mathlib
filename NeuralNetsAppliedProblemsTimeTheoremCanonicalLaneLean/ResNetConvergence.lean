import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure ResNetSkipConnection where
  residualBlockCount : Nat
  gradientFlowPreservation : Prop
  identityMappingGap : Prop
  depthNormalization : Prop

def ResNetTrainable (R : ResNetSkipConnection) : Prop :=
  R.gradientFlowPreservation ∧ R.identityMappingGap ∧ R.depthNormalization

theorem res_net_trainable (R : ResNetSkipConnection) (hGrad : R.gradientFlowPreservation) (hIdent : R.identityMappingGap) (hDepth : R.depthNormalization) :
  ResNetTrainable R := by
  exact And.intro hGrad (And.intro hIdent hDepth)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
