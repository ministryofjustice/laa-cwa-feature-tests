module SubmissionConfig
  module CategoriesOfLaw
    class Education < Base

      define_matter_type1_codes({
        EEQU: 'Contravention of Equality 2010 (non-Disability Discrimination)',
        EDJR: 'Initial advice on a judicial review (including challenges about adminssions and exclusions)',
        EADM: 'Admission/choice of an institution (non-SEN and non-DDA)',
        EDDA: 'Disability discrimination at nursery, school, college or LEA',
        EDOT: 'Other',
        EGTO: 'Grants, transport and other local education authority services',
        ENEG: 'Concern over level or quality of education, bullying or other professional negligence',
        EPRO: 'Non-attendance and proceedings against parents',
        EREO: 'Institution establishment/reorganisation (opening, closing, merging etc)',
        ESEN: 'Special educational needs and/or children unable to attend school',
        EXCE: 'Exclusion/refusal to provide full time education (non-SEN and non-DDA)',
      })

      define_matter_type2_codes({
        EAAP: 'AAP',
        ECOL: 'Non university college',
        EDSC: 'School',
        EHEF: 'HEFC/Other',
        EIAP: 'IAP',
        ELOC: 'LEA',
        ENUR: 'Nursery',
        EOTH: 'Other',
        EPRU: 'PRU',
        ESOS: 'SOS / DfES',
        EUNI: 'University',
      })

      MATTER_TYPE2_CODES_SET1 = %i[EAAP ECOL EDSC EHEF EIAP ELOC ENUR EOTH EPRU ESOS EUNI]
      MATTER_TYPE2_CODES_SET2 = %i[ENUR EDSC EPRU ECOL EUNI EAAP ELOC EIAP ESOS EHEF EOTH]
      private_constant :MATTER_TYPE2_CODES_SET1, :MATTER_TYPE2_CODES_SET2

      define_matter_type_code_combinations({
        EEQU: MATTER_TYPE2_CODES_SET1,
        EDJR: MATTER_TYPE2_CODES_SET1,
        EADM: MATTER_TYPE2_CODES_SET2,
        EDDA: MATTER_TYPE2_CODES_SET2,
        EDOT: MATTER_TYPE2_CODES_SET2,
        EGTO: MATTER_TYPE2_CODES_SET2,
        ENEG: MATTER_TYPE2_CODES_SET2,
        EPRO: MATTER_TYPE2_CODES_SET2,
        EREO: MATTER_TYPE2_CODES_SET2,
        ESEN: MATTER_TYPE2_CODES_SET2,
        EXCE: MATTER_TYPE2_CODES_SET2,
      })

      define_standard_fee 272
      define_escape_fee_threshold_formula 'standard_fee * 3'
    end
  end
end
