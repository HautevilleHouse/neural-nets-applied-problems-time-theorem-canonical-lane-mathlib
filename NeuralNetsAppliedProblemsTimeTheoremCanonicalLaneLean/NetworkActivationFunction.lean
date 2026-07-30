import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure ActivationFunctionPackage where
  functionType : Type
  LipschitzConstant : ℝ
  monotonicity : Prop
  boundedness : Prop
  smoothness : Prop
  activationFunctionDefined : Prop

structure ActivationFunctionEvidence (A : ActivationFunctionPackage) where
  LipschitzConstantClosed : A.LipschitzConstant > 0
  monotonicityClosed : A.monotonicity
  boundednessClosed : A.boundedness
  smoothnessClosed : A.smoothness
  activationFunctionDefinedClosed : A.activationFunctionDefined

def ActivationFunctionClosed (A : ActivationFunctionPackage) : Prop :=
  A.LipschitzConstant > 0 ∧ A.monotonicity ∧ A.boundedness ∧ A.smoothness ∧ A.activationFunctionDefined

theorem activation_function_closed_from_evidence (A : ActivationFunctionPackage)
    (E : ActivationFunctionEvidence A) : ActivationFunctionClosed A := by
  exact And.intro E.LipschitzConstantClosed
    (And.intro E.monotonicityClosed
      (And.intro E.boundednessClosed
        (And.intro E.smoothnessClosed E.activationFunctionDefinedClosed)))

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse