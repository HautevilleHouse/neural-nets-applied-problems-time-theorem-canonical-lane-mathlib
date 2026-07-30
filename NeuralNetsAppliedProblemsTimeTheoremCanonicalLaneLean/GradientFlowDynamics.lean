import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure GradientFlowPackage where
  timeDomain : Type
  parameterSpace : Type
  lossFunction : parameterSpace → ℝ
  gradientVectorField : parameterSpace → parameterSpace
  flowEquation : Prop
  existenceInterval : ℝ
  uniquenessOfSolutions : Prop

structure GradientFlowEvidence (G : GradientFlowPackage) where
  flowEquationClosed : G.flowEquation
  existenceIntervalClosed : G.existenceInterval > 0
  uniquenessOfSolutionsClosed : G.uniquenessOfSolutions

def GradientFlowClosed (G : GradientFlowPackage) : Prop :=
  G.flowEquation ∧ G.existenceInterval > 0 ∧ G.uniquenessOfSolutions

theorem gradient_flow_closed_from_evidence (G : GradientFlowPackage)
    (E : GradientFlowEvidence G) : GradientFlowClosed G := by
  exact And.intro E.flowEquationClosed
    (And.intro E.existenceIntervalClosed E.uniquenessOfSolutionsClosed)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse