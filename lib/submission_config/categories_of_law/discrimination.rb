module SubmissionConfig
  module CategoriesOfLaw
    class Discrimination < Base

      define_matter_type1_codes({
        QCON: 'Contracts',
        QEDU: 'Education',
        QEMP: 'Employment',
        QEQP: 'Equality of terms/Equal pay',
        QFUN: 'Exercise of public function',
        QPRE: 'Premises/Housing',
        QPRO: 'Provision of goods and services',
        QPUB: 'Public sector equality duty',
      })

      define_matter_type2_codes({
        QAGE: 'Age',
        QDIS: 'Disability',
        QGEN: 'Gender reassignment',
        QMCP: 'Marriage and civil partnership',
        QMDI: 'Multiple discrimination',
        QPRM: 'Pregnancy and maternity',
        QRAC: 'Race',
        QROB: 'Religion or belief',
        QSEX: 'Sex',
        QSOR: 'Sexual orientation',
      })

      MATTER_TYPE2_CODES_COMMON = %i[QAGE QDIS QGEN QMCP QMDI QPRM QRAC QROB QSEX QSOR]
      private_constant :MATTER_TYPE2_CODES_COMMON

      define_matter_type_code_combinations({
        QCON: MATTER_TYPE2_CODES_COMMON,
        QEDU: MATTER_TYPE2_CODES_COMMON,
        QEMP: MATTER_TYPE2_CODES_COMMON,
        QEQP: MATTER_TYPE2_CODES_COMMON,
        QFUN: MATTER_TYPE2_CODES_COMMON,
        QPRE: MATTER_TYPE2_CODES_COMMON,
        QPRO: MATTER_TYPE2_CODES_COMMON,
        QPUB: MATTER_TYPE2_CODES_COMMON,
      })

      define_escape_fee_threshold_formula '700'
      define_max_price_cap 700
    end
  end
end
