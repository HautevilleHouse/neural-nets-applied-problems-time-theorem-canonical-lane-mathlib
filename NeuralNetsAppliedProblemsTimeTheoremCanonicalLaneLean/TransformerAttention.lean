import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean

structure TransformerSelfAttention where
  modelDimension : Nat
  numAttentionHeads : Nat
  contextWindowLength : Nat
  queryKeyCompatibility : Prop
  valueWeightAveraging : Prop
  positionalEncoding : Prop

def TransformerCapacity (T : TransformerSelfAttention) : Prop :=
  T.queryKeyCompatibility ∧ T.valueWeightAveraging ∧ T.positionalEncoding

theorem transformer_has_capacity (T : TransformerSelfAttention) (hQuery : T.queryKeyCompatibility) (hValue : T.valueWeightAveraging) (hPos : T.positionalEncoding) :
  TransformerCapacity T := by
  exact And.intro hQuery (And.intro hValue hPos)

end NeuralNetsAppliedProblemsTimeTheoremCanonicalLaneLean
end HautevilleHouse
